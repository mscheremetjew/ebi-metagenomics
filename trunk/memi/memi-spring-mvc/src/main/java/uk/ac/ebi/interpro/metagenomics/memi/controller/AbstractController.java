package uk.ac.ebi.interpro.metagenomics.memi.controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;
import uk.ac.ebi.interpro.metagenomics.memi.basic.MemiPropertyContainer;
import uk.ac.ebi.interpro.metagenomics.memi.model.hibernate.SecureEntity;
import uk.ac.ebi.interpro.metagenomics.memi.services.EmailNotificationService;
import uk.ac.ebi.interpro.metagenomics.memi.services.INotificationService;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.model.Breadcrumb;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.model.MGModel;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.model.MGModelFactory;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.session.SessionManager;

import javax.annotation.Resource;
import java.util.List;

/**
 * Represents an abstract controller class, which extends all more specific controllers.
 *
 * @author Maxim Scheremetjew, EMBL-EBI, InterPro
 * @version $Id$
 * @since 1.0-SNAPSHOT
 */
public abstract class AbstractController {
    @Resource
    protected SessionManager sessionManager;

    @Resource
    protected MemiPropertyContainer propertyContainer;

    @Resource(name = "defaultEmailNotificationService")
    private INotificationService emailService;

    protected abstract String getModelViewName();

    protected abstract List<Breadcrumb> getBreadcrumbs(SecureEntity obj);

    public void setSessionManager(SessionManager sessionManager) {
        this.sessionManager = sessionManager;
    }

    public void setPropertyContainer(MemiPropertyContainer propertyContainer) {
        this.propertyContainer = propertyContainer;
    }

    //List of exception handler methods

    // TODO: This handler does not work for HTTP status code 404 errors
    @ExceptionHandler(NoSuchRequestHandlingMethodException.class)
    public ModelAndView handleNoSuchRequestException(NoSuchRequestHandlingMethodException ex) {
        MGModel mgModel = MGModelFactory.getMGModel(sessionManager);
        ModelMap model = new ModelMap();
        model.addAttribute(MGModel.MODEL_ATTR_NAME, mgModel);
        return new ModelAndView("/errors/" + CommonController.NO_SUCH_REQUEST_PAGE_VIEW_NAME, model);
    }

    @ExceptionHandler(NullPointerException.class)
    public ModelAndView handleNPExceptions(NullPointerException e) {
        sendEmail(e);
        MGModel mgModel = MGModelFactory.getMGModel(sessionManager);
        ModelMap model = new ModelMap();
        model.addAttribute(MGModel.MODEL_ATTR_NAME, mgModel);
        return new ModelAndView("/errors/" + CommonController.EXCEPTION_PAGE_VIEW_NAME, model);
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleAllExceptions(Exception e) {
        MGModel mgModel = MGModelFactory.getMGModel(sessionManager);
        ModelMap model = new ModelMap();
        model.addAttribute(MGModel.MODEL_ATTR_NAME, mgModel);
        return new ModelAndView("/errors/" + CommonController.EXCEPTION_PAGE_VIEW_NAME, model);
    }

    private void sendEmail(NullPointerException e) {
        ((EmailNotificationService) emailService).setSender("mg-portal@ebi.ac.uk");
        ((EmailNotificationService) emailService).setReceiver("maxim@ebi.ac.uk");
        ((EmailNotificationService) emailService).setEmailSubject("[MG portal] Exception occurred");
        emailService.sendNotification("Following exception has been occurred:", e);
    }
}