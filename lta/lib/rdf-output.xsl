<?xml version="1.0" encoding="UTF-8"?>
<!--
    W3C® SOFTWARE NOTICE AND LICENSE
    http://www.w3.org/Consortium/Legal/2002/copyright-software-20021231

    This work (and included software, documentation such as READMEs, or other related items) is being provided by the copyright holders under the following license. By obtaining, using and/or copying this work, you (the licensee) agree that you have read, understood, and will comply with the following terms and conditions.

    Permission to copy, modify, and distribute this software and its documentation, with or without modification, for any purpose and without fee or royalty is hereby granted, provided that you include the following on ALL copies of the software and documentation or portions thereof, including modifications:

    1. The full text of this NOTICE in a location viewable to users of the redistributed or derivative work.
    2. Any pre-existing intellectual property disclaimers, notices, or terms and conditions. If none exist, the W3C Software Short Notice should be included (hypertext is preferred, text is permitted) within the body of any redistributed or derivative code.
    3. Notice of any changes or modifications to the files, including the date changes were made. (We recommend you provide URIs to the location from which the code is derived.)

    THIS SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS," AND COPYRIGHT HOLDERS MAKE NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF THE SOFTWARE OR DOCUMENTATION WILL NOT INFRINGE ANY THIRD PARTY PATENTS, COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS.

    COPYRIGHT HOLDERS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF ANY USE OF THE SOFTWARE OR DOCUMENTATION.

    The name and trademarks of copyright holders may NOT be used in advertising or publicity pertaining to the software without specific, written prior permission. Title to copyright in this software and any associated documentation will at all times remain with copyright holders.

    ____________________________________

    This formulation of W3C's notice and license became active on December 31 2002. This version removes the copyright ownership notice such that this license can be used with materials other than those owned by the W3C, reflects that ERCIM is now a host of the W3C, includes references to this specific dated version of the license, and removes the ambiguous grant of "use". Otherwise, this version is the same as the previous version and is written so as to preserve the Free Software Foundation's assessment of GPL compatibility and OSI's certification under the Open Source Definition. Please see our Copyright FAQ for common questions about using materials from our site, including specific terms and conditions for packages like libwww, Amaya, and Jigsaw. Other questions about this notice can be directed to site-policy@w3.org.
    
  -->

<!-- Language Tag Analyzer (LTA) - version 0.2. rdf-output.xsl
     For documentation, see http://www.w3.org/2008/05/lta/
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
		xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:saxon="http://saxon.sf.net/"
		xmlns:my="http://example.com/myns" xmlns:lta="http://www.w3.org/2008/05/lta/"
		xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="my saxon xs h lta">
  <!-- RDF output -->
  <xsl:template mode="rdf" match="lta:Language-Tag">
    <xsl:text>@prefix lta: &lt;http://www.w3.org/2008/05/lta/&gt; .&#xA;@prefix ltainstance: &lt;http://www.w3.org/2008/05/lta/instance&gt; .&#xA;@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .&#xA;</xsl:text>
    <xsl:value-of select="concat('ltainstance:',$inputlangtag)"/>
    <xsl:text>&#x20;rdf:type lta:languagetag.&#xA;</xsl:text>
    <xsl:apply-templates mode="rdf"/>
  </xsl:template>
  <xsl:template mode="rdf" match="* |@*">
    <xsl:variable name="subtag" select="*/@su | */@ta"/>
    <xsl:value-of
       select="concat('ltainstance:',$subtag,'&#x20;','rdf:type&#x20;',name(),'_subtag.&#xA;')"/>
    <xsl:for-each select="*/@*[not(name()='su' or name()='ty')]">
      <xsl:value-of select="concat('ltainstance:', $subtag,'&#x20;', name(), ' &#x22;', ., '&#x22;.')"/>
      <xsl:text>&#xA;</xsl:text>
    </xsl:for-each>
  <xsl:for-each select="*/*">
 <xsl:value-of
       select="concat('ltainstance:', parent::*/@su | parent::*/@ta,'&#x20;', name(),' &#x22;', normalize-space(.),'&#x22;.')"/>
<xsl:text>&#xA;</xsl:text>
</xsl:for-each>
  </xsl:template>
  <xsl:template match="lta:notWellformed" mode="rdf">
    <xsl:value-of
       select="concat
	       ('ltainstance:',@restTag,'&#x20;rdf:type&#x20;lta:notWellformed.')"/>
  </xsl:template>
</xsl:stylesheet>
