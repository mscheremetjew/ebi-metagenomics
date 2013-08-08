package uk.ac.ebi.interpro.metagenomics.memi.services;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import uk.ac.ebi.interpro.metagenomics.memi.core.MemiPropertyContainer;
import uk.ac.ebi.interpro.metagenomics.memi.model.EmgFile;
import uk.ac.ebi.interpro.metagenomics.memi.springmvc.model.analysisPage.ResultFileDefinition;

import java.io.File;

public final class FileObjectBuilder {

    private static final Log log = LogFactory.getLog(FileObjectBuilder.class);

    //TODO: Describe how some file names are generated
    public static File createFileObject(final EmgFile emgFile,
                                        final MemiPropertyContainer propertyContainer,
                                        final ResultFileDefinition resultFile) {
        //Get directory name + root path
        final String directoryName = emgFile.getFileIDInUpperCase().replace('.', '_');
        final String rootDirPathName = propertyContainer.getPathToAnalysisDirectory() + directoryName;

        String relativePath = resultFile.getRelativePath();
        String fileNameEnding = resultFile.getFileNameEnding();

        //e.g. <rootDirPathName>/ERR071289_FASTQ_I5.tsv
        if (fileNameEnding != null && relativePath == null) {
            return new File(rootDirPathName + '/' + directoryName + fileNameEnding);

        }//e.g. <rootDirPathName>/otus/rep_set.tre
        else if (fileNameEnding == null && relativePath != null) {
            return new File(rootDirPathName + relativePath);
        } //e.g. <rootDirPathName>/otus/rdp_assigned_taxonomy/ERR071289_FASTQ__rRNAFiltered.fasta_rep_set_tax_assignments.txt
        else if (fileNameEnding != null && relativePath != null) {
            return new File(rootDirPathName + relativePath + '/' + directoryName + fileNameEnding);
        } else {
            //This case is not supported
            log.warn("Result file definition misconfigured!");
            return null;
        }
    }
}