package uk.ac.ebi.interpro.metagenomics.memi.controller;

/**
 * Useful for controllers (like {@link SubmissionController}),
 * which have to check if somebody is logged in.
 *
 * @author Maxim Scheremetjew, EMBL-EBI, InterPro
 * @version $Id$
 * @since 1.0-SNAPSHOT
 */
public abstract class CheckLoginController extends AbstractController {

//    /**
//     * Checks if somebody is logged in.
//     */
//    protected boolean isUserAssociatedToSession() {
//        if (sessionManager != null && sessionManager.getSessionBean() != null
//                && sessionManager.getSessionBean().getSubmitter() != null) {
//            return true;
//        }
//        return false;
//    }
}
