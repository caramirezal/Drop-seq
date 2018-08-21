/*
 * MIT License
 *
 * Copyright 2017 Broad Institute
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
package org.broadinstitute.dropseqrna.utils;

import htsjdk.samtools.reference.FastaReferenceWriter;
import htsjdk.samtools.reference.FastaReferenceWriterBuilder;
import htsjdk.samtools.util.IOUtil;
import htsjdk.samtools.util.StringUtil;
import picard.PicardException;

import java.io.File;
import java.io.IOException;

/**
 * Utility to write Fasta files.
 * Thin wrapper around htsjdk.samtools.reference.FastaReferenceWriter
 */
public class FastaSequenceFileWriter {

    private final FastaReferenceWriter impl;
    private static int DEFAULT_LINE_LENGTH = 50;    // Length of lines of sequence in the fasta file

    /**
     * Constructor that uses the default line length.  Checks that the file is
     * writeable and creates a BufferedWriter to do the writing
     */
    public FastaSequenceFileWriter(File fastaFile) {
        this(fastaFile, DEFAULT_LINE_LENGTH);
    }

    /**
     * Constructor that uses a user-provided line length
     */
    public FastaSequenceFileWriter(File fastaFile, int lineLength) {
        IOUtil.assertFileIsWritable(fastaFile);
        try {
            impl = new FastaReferenceWriterBuilder().setFastaFile(fastaFile).setBasesPerLine(lineLength).build();
        }
        catch (IOException ioe) {
            throw new PicardException("Error creating FastaReferenceWriter " + fastaFile.getAbsolutePath() +
                    ": " + ioe.getMessage(), ioe);
        }
    }


    /**
     * Writes a sequence to the file.  Prefaces the name with ">" and writes
     * the sequence itself in lines whose length is specified by <code>lineLength</code>
     */
    public void writeSequence(String name, String sequence) {
        try {
            impl.appendSequence(name, StringUtil.stringToBytes(sequence));
        }
        catch (IOException ioe) {
            throw new PicardException("Error writing to fasta file: " + ioe.getMessage(), ioe);
        }
    }


    /**
     * Closes the BufferedWriter
     */
    public void close() {
        try {
            impl.close();
        }
        catch (IOException ioe) {
            throw new RuntimeException(ioe);
        }
    }
}
