package uk.ac.ebi.interpro.metagenomics.memi.springmvc.modelbuilder;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import uk.ac.ebi.interpro.metagenomics.memi.basic.MemiPropertyContainer;
import uk.ac.ebi.interpro.metagenomics.memi.basic.comparators.PublicationComparator;
import uk.ac.ebi.interpro.metagenomics.memi.dao.HibernateSampleDAO;
import uk.ac.ebi.interpro.metagenomics.memi.model.hibernate.Publication;
import uk.ac.ebi.interpro.metagenomics.memi.model.hibernate.PublicationType;
import uk.ac.ebi.interpro.metagenomics.memi.model.hibernate.Sample;
import uk.ac.ebi.interpro.metagenomics.memi.model.hibernate.Study;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.model.Breadcrumb;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.model.StudyViewModel;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.session.SessionManager;

import java.util.Collections;
import java.util.ArrayList;
import java.util.List;

/**
 * Model builder class for StudyViewModel. See {@link ViewModelBuilder} for more information of how to use.
 *
 * @author Maxim Scheremetjew, EMBL-EBI, InterPro
 * @version $Id$
 * @since 1.0-SNAPSHOT
 */
public class StudyViewModelBuilder extends AbstractViewModelBuilder<StudyViewModel> {

    private final static Log log = LogFactory.getLog(StudyViewModelBuilder.class);

    private String pageTitle;

    private List<Breadcrumb> breadcrumbs;

    private MemiPropertyContainer propertyContainer;

    private Study study;

    private HibernateSampleDAO sampleDAO;

    private List<Publication> relatedLinks;

    private List<Publication> relatedPublications;


    public StudyViewModelBuilder(SessionManager sessionMgr, String pageTitle, List<Breadcrumb> breadcrumbs, MemiPropertyContainer propertyContainer,
                                 Study study, HibernateSampleDAO sampleDAO) {
        super(sessionMgr);
        this.pageTitle = pageTitle;
        this.breadcrumbs = breadcrumbs;
        this.propertyContainer = propertyContainer;
        this.study = study;
        this.sampleDAO = sampleDAO;
        this.relatedLinks = new ArrayList<Publication>();
        this.relatedPublications = new ArrayList<Publication>();
    }

    @Override
    public StudyViewModel getModel() {
        log.info("Building instance of " + StudyViewModel.class + "...");
        List<Sample> samples = sampleDAO.retrieveSamplesByStudyId(study.getId());
        buildPublicationLists();
        return new StudyViewModel(getSessionSubmitter(sessionMgr), study, samples, pageTitle,
                breadcrumbs, propertyContainer, relatedPublications, relatedLinks);
    }

    /**
     * Divides the set of publications into 2 different types of publication sets.
     */
    private void buildPublicationLists() {
        for (Publication pub : study.getPublications()) {
            if (pub.getPubType().equals(PublicationType.PUBLICATION)) {
                relatedPublications.add(pub);
            } else if (pub.getPubType().equals(PublicationType.WEBSITE_LINK)) {
                relatedLinks.add(pub);
            }
        }
        //Sorting lists
        Collections.sort(relatedPublications, new PublicationComparator());
        Collections.sort(relatedLinks, new PublicationComparator());
    }
}