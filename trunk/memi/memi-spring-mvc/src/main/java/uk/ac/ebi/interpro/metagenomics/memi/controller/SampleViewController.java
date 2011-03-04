package uk.ac.ebi.interpro.metagenomics.memi.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import uk.ac.ebi.interpro.metagenomics.memi.dao.EmgLogFileInfoDAO;
import uk.ac.ebi.interpro.metagenomics.memi.dao.HibernateSampleDAO;
import uk.ac.ebi.interpro.metagenomics.memi.dao.ISampleStudyDAO;
import uk.ac.ebi.interpro.metagenomics.memi.model.hibernate.EnvironmentSample;
import uk.ac.ebi.interpro.metagenomics.memi.model.hibernate.HostSample;
import uk.ac.ebi.interpro.metagenomics.memi.model.hibernate.Sample;
import uk.ac.ebi.interpro.metagenomics.memi.model.hibernate.Study;
import uk.ac.ebi.interpro.metagenomics.memi.services.MemiDownloadService;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.model.MGModel;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.model.MGModelFactory;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.model.SampleViewModel;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Represents the controller for sample overview page.
 *
 * @author Maxim Scheremetjew, EMBL-EBI, InterPro
 * @since 1.0-SNAPSHOT
 */
@Controller
@RequestMapping("/" + SampleViewController.VIEW_NAME + "/{sampleId}")
public class SampleViewController extends SecuredAbstractController<Sample> {
    private static final Log log = LogFactory.getLog(SampleViewController.class);
    /**
     * View name of this controller which is used several times.
     */
    public static final String VIEW_NAME = "sample";

    @Resource
    private HibernateSampleDAO sampleDAO;

    @Resource
    private EmgLogFileInfoDAO fileInfoDAO;

    @Resource
    private VelocityEngine velocityEngine;

    @Resource
    private MemiDownloadService downloadService;

    //GET request method

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView doGetSample(final ModelMap model, @PathVariable final String sampleId) {
        log.info("Checking if sample is accessible...");
        return checkAccessAndBuildModel(new ModelProcessingStrategy<Sample>() {
            @Override
            public void processModel(ModelMap model, Sample sample) {
                log.info("Building model...");
                populateModel(model, sample);
            }
        }, model, sampleId);
    }


    @RequestMapping(value = "/doExportDetails", method = RequestMethod.GET)
    public ModelAndView doExportDetails(@PathVariable final String sampleId, ModelMap model, final HttpServletResponse response) {
        log.info("Checking if sample is accessible...");
        return checkAccessAndBuildModel(new ModelProcessingStrategy<Sample>() {
            @Override
            public void processModel(ModelMap model, Sample sample) {
                log.info("Building model...");
                populateModel(model, sample);
                if (downloadService != null) {
                    boolean isDialogOpen = downloadService.openDownloadDialog(response, sample.getClazz(), sampleId);
                    model.addAttribute("isDialogOpen", isDialogOpen);
                }
            }
        }, model, sampleId);
    }


//    private Study.StudyType getSampleType(Sample sample) {
//        if (sample != null) {
//            if (sample instanceof HostSample) {
//                return Study.StudyType.HOST_ASSOCIATED;
//
//            } else if (sample instanceof EnvironmentSample) {
//                return Study.StudyType.ENVIRONMENTAL;
//            }
//        }
//        return Study.StudyType.UNDEFINED;
//    }

    /**
     * Creates the home page model and adds it to the specified model map.
     */
    private void populateModel(final ModelMap model, final Sample sample) {
        final SampleViewModel sampleModel = MGModelFactory.getSampleViewModel(sessionManager, sample, getArchivedSeqs(sample));
        model.addAttribute(MGModel.MODEL_ATTR_NAME, sampleModel);
    }

    private List<String> getArchivedSeqs(Sample sample) {
        List<String> result = new ArrayList<String>();
        if (fileInfoDAO != null && sample != null) {
            result = fileInfoDAO.getFileIdsBySampleId(sample.getSampleId());
        }
        return result;
    }

    ISampleStudyDAO<Sample> getDAO() {
        return sampleDAO;
    }

    String getModelViewName() {
        return VIEW_NAME;
    }
}