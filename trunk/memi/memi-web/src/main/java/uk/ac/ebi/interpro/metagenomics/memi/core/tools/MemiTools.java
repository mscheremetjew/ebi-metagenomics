package uk.ac.ebi.interpro.metagenomics.memi.core.tools;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import uk.ac.ebi.interpro.metagenomics.memi.dao.EmgLogFileInfoDAO;
import uk.ac.ebi.interpro.metagenomics.memi.model.hibernate.Sample;

import java.io.*;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Simple tool class which provides general used methods.
 *
 * @author Maxim Scheremetjew, EMBL-EBI, InterPro
 * @version $Id$
 * @since 1.0-SNAPSHOT
 */
public class MemiTools {
    private final static Log log = LogFactory.getLog(MemiTools.class);

    public static Set<String> getSampleIds(Collection<Sample> samples) {
        log.info("Getting sample IDs from the specified sample list...");
        Set<String> result = new HashSet<String>();
        for (Sample sample : samples) {
            result.add(sample.getSampleId());
        }
        return result;
    }

    /**
     * Determines the generic type of specified collection. The items of the collection should have sub types,
     * that is why it returns the type of the first selected entry.
     */
    public static Class getTypeOfGenericSet(Collection<Sample> samples) {
        for (Sample sample : samples) {
            return sample.getClass();
        }
        return Object.class;
    }

    public static String createFileName(final String fileName) {
        log.info("Creating file name in the following format - FILENAME_yyyyMMdd.csv");
        final String suffix = ".csv";
        Format dateFormatter = new SimpleDateFormat("yyyyMMdd");
        Date date = new Date();
        final String infix = dateFormatter.format(date);
        return fileName + infix + suffix;
    }

    public static List<String> getArchivedSeqs(EmgLogFileInfoDAO fileInfoDAO, Sample sample) {
        List<String> result = new ArrayList<String>();
        if (fileInfoDAO != null && sample != null) {
            result = fileInfoDAO.getSraIDs(sample.getId());
        }
        return result;
    }

    public static void addIndex(StringBuilder indexes, int index) {
        if (indexes.length() > 0) {
            indexes.append(",");
        }
        indexes.append(index);
    }

    private static List<String> readLines(File file) {
        final List<String> result = new ArrayList<String>();
        BufferedReader br = null;

        try {
            String currentLine;
            br = new BufferedReader(new FileReader(file));

            while ((currentLine = br.readLine()) != null) {
                result.add(currentLine);
            }
        } catch (IOException e) {
            log.warn("Could not read the following file: " + file.getAbsolutePath(), e);
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (IOException ex) {
                log.warn("Could not close the buffered reader!", ex);
            }
        }
        return result;
    }

    /**
     * @return Returns a list of absolute file paths.
     */
    public static List<String> getListOfChunkedResultFiles(File file) {
        return readLines(file);
    }
}
