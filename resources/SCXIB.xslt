<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl="http://exslt.org/common"
                xmlns:str="http://exslt.org/strings"
                extension-element-prefixes="exsl str"
                version="1.0">
    <xsl:output method="text" media-type="text" omit-xml-declaration="yes"/>

    <xsl:param name="namespace" />
    <xsl:param name="panelName" />
    <xsl:param name="pageName" />
    <xsl:param name="resourcesPath" />

    <!-- yes, one giant stylesheet because some(most, all?) browsers don't implement xsl:import/include -->

    <xsl:template match="data">
        /*globals <xsl:value-of select="$namespace"/> */
        <xsl:choose>
            <xsl:when test="*[@key='IBDocument.RootObjects']/object[@class='NSWindowTemplate']/string[@key='NSWindowClass'] = 'NSWindow'">
                <xsl:call-template name="Window">
                     <xsl:with-param name="windowNode" select="*[@key='IBDocument.RootObjects']/object[@class='NSWindowTemplate']/object[@key='NSWindowView']"/>
                 </xsl:call-template>
            </xsl:when>
            <xsl:when test="*[@key='IBDocument.RootObjects']/object[@class='NSWindowTemplate']/string[@key='NSWindowClass'] = 'NSPanel'">
                <xsl:call-template name="Panel">
                     <xsl:with-param name="panelNode" select="*[@key='IBDocument.RootObjects']/object[@class='NSWindowTemplate']"/>
                 </xsl:call-template>
            </xsl:when>
            <xsl:when test="*[@key='IBDocument.RootObjects']/object[@class='NSCustomView']">
                <xsl:call-template name="FromCustomView">
                     <xsl:with-param name="windowNode" select="*[@key='IBDocument.RootObjects']/object[@class='NSCustomView']"/>
                 </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="FromCustomView">
                     <xsl:with-param name="windowNode" select="*[@key='IBDocument.RootObjects']/object[@class='NSView']"/>
                 </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="ProcessNodes">
        <xsl:param name="nodes" />
        <xsl:for-each select="$nodes">
            <xsl:variable name="node" select="."/>
            <xsl:choose>
                <xsl:when test="$node[@class='NSTextField']">
                    <xsl:call-template name="NSTextField">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSSplitView']">
                    <xsl:call-template name="NSSplitView">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='IKImageView']">
                    <xsl:call-template name="IKImageView">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSButton']">
                    <xsl:call-template name="NSButton">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSSlider']">
                    <xsl:call-template name="NSSlider">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSProgressIndicator']">
                    <xsl:call-template name="NSProgressIndicator">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>                
                <xsl:when test="$node[@class='NSCollectionView']">
                    <xsl:call-template name="NSCollectionView">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSOutlineView']">
                    <xsl:call-template name="NSOutlineView">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSTableView']">
                    <xsl:call-template name="NSTableView">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSScrollView']">
                    <xsl:call-template name="NSScrollView">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSPopUpButton']">
                    <xsl:call-template name="NSPopUpButton">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSSegmentedControl']">
                    <xsl:call-template name="NSSegmentedControl">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='WebView']">
                    <xsl:call-template name="WebView">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSMatrix']">
                    <xsl:call-template name="NSMatrix">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSTabView']">
                    <xsl:call-template name="NSTabView">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSBox']">
                    <xsl:call-template name="NSBox">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$node[@class='NSClipView']">
                    <xsl:call-template name="NSClipView">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:when>
                
                <xsl:otherwise>
                    <xsl:call-template name="NSCustomView">
                        <xsl:with-param name="node" select="$node"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <!-- class properties -->
    
    <xsl:template name="KeyValuePropertiesForObject">
        <xsl:param name="objectId" />
        <xsl:for-each select="//object[@key='IBDocument.Objects']/*[@key='flattenedProperties']/*/*[@class='IBUserDefinedRuntimeAttributesPlaceholder']">
            <xsl:if test="./reference/@ref = $objectId">
                <xsl:for-each select="./*[@key='userDefinedRuntimeAttributes']/*[@class='IBUserDefinedRuntimeAttribute']">
                    <xsl:value-of select="./string[@key='keyPath']" />:
                    <xsl:choose>
                        <xsl:when test="./real/@value">
                            <xsl:value-of select="./real/@value" />
                        </xsl:when>
                        <xsl:when test="./boolean/@value">
                            <xsl:value-of select="./boolean/@value" />
                        </xsl:when>
                        <xsl:when test="./string[@key='keyPath']='exampleView'">
                            <xsl:value-of select="./string[@key='value']" />
                        </xsl:when>
                        <xsl:when test="./string[@key='keyPath']='recordType'">
                            <xsl:value-of select="./string[@key='value']" />
                        </xsl:when>
                        <!-- when setting individual controls to content, it
                        needs to be without quotes. I wonder is this applies
                        generally -->
                        <xsl:when test="./string[@key='keyPath']='content'">
                            <xsl:value-of select="./string[@key='value']" />
                        </xsl:when>
                        <xsl:otherwise>
                            "<xsl:value-of select="./string[@key='value']" />"
                        </xsl:otherwise>
                    </xsl:choose>,
                </xsl:for-each>
            </xsl:if>
		</xsl:for-each>
    </xsl:template>
    
    <xsl:template name="kvValueForKey">
        <xsl:param name="objectId" />
        <xsl:param name="key" />
        <xsl:for-each select="//object[@key='IBDocument.Objects']/*[@key='flattenedProperties']/*/*[@class='IBUserDefinedRuntimeAttributesPlaceholder']">
            <xsl:if test="./reference/@ref = $objectId">
                <xsl:for-each select="./*[@key='userDefinedRuntimeAttributes']/*[@class='IBUserDefinedRuntimeAttribute']">
                    <xsl:if test="./string[@key='keyPath'] = $key">
                        <xsl:choose>
                            <xsl:when test="./real/@value">
                                <xsl:value-of select="./real/@value" />
                            </xsl:when>
                            <xsl:when test="./boolean/@value">
                                <xsl:value-of select="./boolean/@value" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="./string[@key='value']" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>
		</xsl:for-each>
    </xsl:template>
    
    <xsl:template name="DimensionsFromString">
        <xsl:param name="layoutString"/>        
        <xsl:variable name="d1">
            <xsl:call-template name="str:replace">
                <xsl:with-param name="search" select="'{'" />
                <xsl:with-param name="string" select="$layoutString" />
                <xsl:with-param name="replace" select="''" />
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="d2">
            <xsl:call-template name="str:replace">
                <xsl:with-param name="search" select="'}'" />
                <xsl:with-param name="string" select="$d1" />
                <xsl:with-param name="replace" select="''" />
            </xsl:call-template>
        </xsl:variable>
            <xsl:call-template name="str:split">
               <xsl:with-param name="string" select="$d2" />
               <xsl:with-param name="pattern" select="','" />
            </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="LayoutFromRect">
        <xsl:param name="layoutString"/>
        <xsl:variable name="dimensions">
            <xsl:call-template name="DimensionsFromString">
                 <xsl:with-param name="layoutString" select="$layoutString"/>
             </xsl:call-template>
        </xsl:variable>
        <xsl:if test="count(exsl:node-set($dimensions)/token) &gt; 0">
            layout: {
            bottom: <xsl:value-of select="exsl:node-set($dimensions)/token[2]"/>,
            left: <xsl:value-of select="exsl:node-set($dimensions)/token[1]"/>,
            width: <xsl:value-of select="exsl:node-set($dimensions)/token[3]"/>,
            height: <xsl:value-of select="exsl:node-set($dimensions)/token[4]"/>
            },
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="LayoutFromFrame">
        <xsl:param name="parentNodeRefId"/>
        <xsl:param name="node"/>

        <xsl:variable name="layoutString">
           <xsl:value-of select="$node/string[@key='NSFrame']"/>
        </xsl:variable>
        
        <xsl:variable name="parentNode">
            <xsl:call-template name="NodeFromRef">
                 <xsl:with-param name="nodes" select="//*"/>
                 <xsl:with-param name="refId" select="$parentNodeRefId"/>
             </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="dimensions">
            <xsl:call-template name="DimensionsFromString">
                 <xsl:with-param name="layoutString" select="$layoutString"/>
             </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="fr">
            <xsl:choose>
                <xsl:when test="exsl:node-set($parentNode)[1]/*/string[@key='NSFrame']">
                    <xsl:value-of select="exsl:node-set($parentNode)[1]/*/string[@key='NSFrame']"/>
                </xsl:when>
                <xsl:when test="exsl:node-set($parentNode)[1]/*/string[@key='NSFrameSize']">
                    <xsl:value-of select="exsl:node-set($parentNode)[1]/*/string[@key='NSFrameSize']"/>
                </xsl:when>
                <xsl:otherwise>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
                
        <xsl:variable name="parentDimensions">
            <xsl:call-template name="DimensionsFromString">
                 <xsl:with-param name="layoutString" select="$fr"/>
             </xsl:call-template>
        </xsl:variable>
                
         <xsl:variable name="top">
             <xsl:choose>
                 <xsl:when test="count(exsl:node-set($parentDimensions)/token) = 2">
                     <xsl:value-of select="number(exsl:node-set($parentDimensions)/token[2]) - (number(exsl:node-set($dimensions)/token[4]) + number(exsl:node-set($dimensions)/token[2]))"/>
                </xsl:when>
                <xsl:when test="count(exsl:node-set($parentDimensions)/token) = 4">
                    <xsl:value-of select="number(exsl:node-set($parentDimensions)/token[4]) - (number(exsl:node-set($dimensions)/token[4]) + number(exsl:node-set($dimensions)/token[2]))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
         <xsl:variable name="parentHeight">
             <xsl:choose>
                 <xsl:when test="count(exsl:node-set($parentDimensions)/token) = 2">
                     <xsl:value-of select="number(normalize-space(exsl:node-set($parentDimensions)/token[2]))"/>
                </xsl:when>
                <xsl:when test="count(exsl:node-set($parentDimensions)/token) = 4">
                    <xsl:value-of select="number(normalize-space(exsl:node-set($parentDimensions)/token[4]))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>        
        
        <xsl:if test="count(exsl:node-set($dimensions)/token) &gt; 0">
            layout: {
            <xsl:variable name="frame">
                <frame>                                        
                    <xsl:choose>
                        <xsl:when test="count(exsl:node-set($dimensions)/token) = 2">
                            <top>
                                <xsl:value-of select="$top"/>
                            </top>
                            <width>
                                <xsl:value-of select="exsl:node-set($dimensions)/token[1]"/>
                            </width>
                            <height>
                                <xsl:value-of select="exsl:node-set($dimensions)/token[2]"/>
                            </height>
                        </xsl:when>
                        <xsl:when test="count(exsl:node-set($dimensions)/token) = 4">
                            <top>
                                <xsl:value-of select="$top"/>
                            </top>
                            <left>
                                <xsl:value-of select="exsl:node-set($dimensions)/token[1]"/>
                            </left>
                            <bottom>
                                <xsl:value-of select="exsl:node-set($dimensions)/token[2]"/>
                            </bottom>
                            <width>
                                <xsl:value-of select="exsl:node-set($dimensions)/token[3]"/>
                            </width>
                            <height>
                                <xsl:value-of select="exsl:node-set($dimensions)/token[4]"/>
                            </height>
                        </xsl:when>
                        <xsl:otherwise>
                             <top>0</top><left>0</left>
                        </xsl:otherwise>
                    </xsl:choose>
                </frame>
            </xsl:variable>

            <xsl:choose>
                <xsl:when test="(floor($node/*[@key='NSvFlags'] div 16) mod 2 = 1)">
                    <xsl:choose>
                        <xsl:when test="exsl:node-set($frame)/frame/height">
                            bottom: <xsl:value-of select="$parentHeight - exsl:node-set($frame)/frame/height"/>,
                        </xsl:when>
                        <xsl:otherwise>
                            bottom: 0,
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="exsl:node-set($frame)/frame/height">
                        height:<xsl:copy-of select="exsl:node-set($frame)/frame/height"/>,
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="(floor($node/*[@key='NSvFlags'] div 2) mod 2 = 1)">
                    right:<xsl:copy-of select="number(exsl:node-set($frame)/frame/left) + number(exsl:node-set($frame)/frame/left)"/>,
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="exsl:node-set($frame)/frame/width">
                        width:<xsl:copy-of select="exsl:node-set($frame)/frame/width"/>,                
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
            left:<xsl:copy-of select="number(exsl:node-set($frame)/frame/left)"/>,
            top:<xsl:copy-of select="number(exsl:node-set($frame)/frame/top)"/>,
            },
        </xsl:if>
    </xsl:template>

    <xsl:template name="ProcessTabs">
        <xsl:param name="nodes" />
        <xsl:for-each select="$nodes">
            <xsl:choose>
                <xsl:when test="./@class='NSTabView'">
                    <xsl:for-each select="./*[@key='NSTabViewItems']/*[@class='NSTabViewItem']">
                            <xsl:value-of select="concat(
                                    $namespace,
                                    '._',
                                    ./@id)"/> = 

                                    SC.Page.create({

                                      mainView:
                                        <xsl:call-template name="NSCustomView">
                                            <xsl:with-param name="node" select="./*[@class='NSView']" />
                                        </xsl:call-template>
                                    });
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="ProcessTabs">
                        <xsl:with-param name="nodes" select="./*[@key='NSSubviews']/*" />
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="NodeFromRef">
        <xsl:param name="nodes" />
        <xsl:param name="refId" />
        <xsl:for-each select="$nodes">
            <xsl:choose>
                <xsl:when test="./@id=$refId">
                    <xsl:copy-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                     <xsl:call-template name="NodeFromRef">
                         <xsl:with-param name="nodes" select="./*[@key='NSSubviews']/object" />
                         <xsl:with-param name="refId" select="$refId" />
                     </xsl:call-template>
                 </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <!-- NS to SC class mappings -->

    <xsl:template name="Window">
        <xsl:param name="windowNode"/>
        <xsl:call-template name="ProcessTabs">
            <xsl:with-param name="nodes" select="$windowNode/*[@key='NSSubviews']/object" />
        </xsl:call-template>
        <xsl:value-of select="$namespace"/>.<xsl:value-of select="$pageName"/> = SC.Page.design({
            mainPane: SC.MainPane.design({
                layout: {top:0, left:0, right:0, bottom:0},
                childViews:[
                <xsl:call-template name="ProcessNodes">
                    <xsl:with-param name="nodes" select="$windowNode/*[@key='NSSubviews']/object" />
                </xsl:call-template>
                ]
            })
        });
    </xsl:template>
    
    <xsl:template name="FromCustomView">
        <xsl:param name="windowNode"/>
        <xsl:call-template name="ProcessTabs">
            <xsl:with-param name="nodes" select="$windowNode/*[@key='NSSubviews']/object" />
        </xsl:call-template>
        <xsl:value-of select="$namespace"/>.<xsl:value-of select="$pageName"/> = SC.View.design({
        <xsl:call-template name="LayoutFromFrame">
                <xsl:with-param name="node" select="$windowNode"/>
                <xsl:with-param name="parentNodeRefId" select="$windowNode/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$windowNode/@id"/>
            </xsl:call-template>
            <xsl:if test="count($windowNode/*[@key='NSSubviews']/object) &gt; 0">
                childViews:[
                <xsl:for-each select="$windowNode/*[@key='NSSubviews']/object">
                    <xsl:call-template name="ProcessNodes">
                        <xsl:with-param name="nodes" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                ]
            </xsl:if>
        });
    </xsl:template>

    <xsl:template name="Panel">
        <xsl:param name="panelNode"/>
        <xsl:call-template name="ProcessTabs">
            <xsl:with-param name="nodes" select="$panelNode/object[@key='NSWindowView']/*[@key='NSSubviews']/object" />
        </xsl:call-template>
        <xsl:value-of select="$namespace"/>.<xsl:value-of select="$panelName"/> = SC.PanelPane.extend({
            <xsl:call-template name="LayoutFromRect">
                <xsl:with-param name="layoutString" select="$panelNode/string[@key='NSWindowRect']"/>
            </xsl:call-template>
            contentView: SC.View.extend({
                childViews:[
                <xsl:call-template name="ProcessNodes">
                    <xsl:with-param name="nodes" select="$panelNode/object[@key='NSWindowView']/*[@key='NSSubviews']/object" />
                </xsl:call-template>
                ]
            })
        });
    </xsl:template>

    <xsl:template name="NSCustomView">
        <xsl:param name="node" />
        <xsl:choose>
            <xsl:when test="//*[@key='IBDocument.Classes']/*[@key='referencedPartialClassDescriptions']/*[@class='IBPartialClassDescription']/string[@key='className'] = $node/string[@key='NSClassName']">
                <xsl:value-of select="concat($namespace, '.', $node/string[@key='NSClassName'])"/>.design({
                    <xsl:call-template name="LayoutFromFrame">
                        <xsl:with-param name="node" select="$node"/>
                        <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
                    </xsl:call-template>
                    <xsl:call-template name="KeyValuePropertiesForObject">
                        <xsl:with-param name="objectId" select="$node/@id"/>
                    </xsl:call-template>
                    <xsl:if test="count($node/*[@key='NSSubviews']/object) &gt; 0">
                        childViews:[
                        <xsl:for-each select="$node/*[@key='NSSubviews']/object">
                            <xsl:call-template name="ProcessNodes">
                                <xsl:with-param name="nodes" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                        ]
                    </xsl:if>
                }),
            </xsl:when>
            <xsl:otherwise>
                SC.View.design({
                    <xsl:call-template name="LayoutFromFrame">
                        <xsl:with-param name="node" select="$node"/>
                        <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
                    </xsl:call-template>
                    <xsl:call-template name="KeyValuePropertiesForObject">
                        <xsl:with-param name="objectId" select="$node/@id"/>
                    </xsl:call-template>
                    <xsl:if test="count($node/*[@key='NSSubviews']/object) &gt; 0">
                        childViews:[
                        <xsl:for-each select="$node/*[@key='NSSubviews']/object">
                            <xsl:call-template name="ProcessNodes">
                                <xsl:with-param name="nodes" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                        ]
                    </xsl:if>
                }),
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template name="NSTextField">
        <xsl:param name="node" />
    		<xsl:choose>
    		    <xsl:when test="$node/object[@class='NSTextFieldCell']/int[@key='NSCellFlags'] = 68288064">
    		        SC.LabelView.design({
    		    </xsl:when>
    		    <xsl:otherwise>
                    SC.TextFieldView.design({
                    <xsl:if test="$node/object[@class='NSTextFieldCell']/string[@key='NSPlaceholderString']">
                        hint: "<xsl:value-of select="$node/object[@class='NSTextFieldCell']/string[@key='NSPlaceholderString']"/>",
                    </xsl:if>
    		    </xsl:otherwise>
    		</xsl:choose>
            <xsl:if test="$node/object[@class='NSTextFieldCell']/int[@key='NSCellFlags'] = -1805517311">
               isTextArea: YES,
            </xsl:if>
            <xsl:call-template name="LayoutFromFrame">
                <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            value: "<xsl:value-of select="$node/object[@class='NSTextFieldCell']/string[@key='NSContents']" />"
        }),
    </xsl:template>

    <xsl:template name="NSSplitView">
        <xsl:param name="node" />
        SC.SplitView.design({
            <xsl:call-template name="LayoutFromFrame">
                <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            layoutDirection:
                <xsl:choose>
                    <xsl:when test="$node/bool[@key='NSIsVertical'] = YES">
                        SC.LAYOUT_VERTICAL
                    </xsl:when>
                    <xsl:otherwise>
                        SC.LAYOUT_HORIZONTAL
                    </xsl:otherwise>
                </xsl:choose>,
            dividerThickness:
                <xsl:choose>
                    <xsl:when test="$node/bool[@key='NSDividerStyle'] = 3">
                        1
                    </xsl:when>
                    <xsl:otherwise>
                        5
                    </xsl:otherwise>
                </xsl:choose>,
            topLeftView:
            <xsl:call-template name="ProcessNodes">
                <xsl:with-param name="nodes" select="$node/*[@key='NSSubviews']/object[1]"/>
            </xsl:call-template>
            dividerView: SC.SplitDividerView,
            bottomRightView:
            <xsl:call-template name="ProcessNodes">
                <xsl:with-param name="nodes" select="$node/*[@key='NSSubviews']/object[2]"/>
            </xsl:call-template>
        }),
    </xsl:template>

    <xsl:template name="IKImageView">
        <xsl:param name="node" />
        SC.ImageView.design({
            <xsl:call-template name="LayoutFromFrame">
                <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:variable name="url">
                <xsl:call-template name="kvValueForKey">
                    <xsl:with-param name="objectId" select="$node/@id"/>
                    <xsl:with-param name="key" select="'value'"/>
                </xsl:call-template>
            </xsl:variable>
            value:"<xsl:value-of select="$resourcesPath"/>images/<xsl:value-of select="normalize-space($url)"/>"
        }),
    </xsl:template>

    <xsl:template name="NSButton">
        <xsl:param name="node" />

            <xsl:choose>
                <xsl:when test="$node/object[@class='NSButtonCell']/int[@key='NSButtonFlags2'] = 2">
                    SC.CheckboxView.design({
                </xsl:when>                
                <xsl:otherwise>
                    SC.ButtonView.design({
                </xsl:otherwise>
            </xsl:choose>

            <xsl:call-template name="LayoutFromFrame">
                <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            title: "<xsl:value-of select="$node/object[@class='NSButtonCell']/string[@key='NSContents']" />"
        }),
    </xsl:template>

    <xsl:template name="NSPopUpButton">
        <xsl:param name="node" />

        SC.SelectFieldView.design({        
            <xsl:call-template name="LayoutFromFrame">
                            <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            objects:[],
            disableSort: YES
        }),
    </xsl:template>
    
    <xsl:template name="NSProgressIndicator">
        <xsl:param name="node" />

        SC.ProgressView.design({        
            <xsl:call-template name="LayoutFromFrame">
                            <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            minimum: 0, 
            maximum: <xsl:value-of select="./double[@key='NSMaxValue']"/>,
            value: 50,
            isIndeterminate: YES
        }),
    </xsl:template>

    <xsl:template name="NSSegmentedControl">
        <xsl:param name="node" />

        SC.SegmentedView.design({        
            <xsl:call-template name="LayoutFromFrame">
                            <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            items: [
                <xsl:for-each select="$node/object[@class='NSSegmentedCell']/object[@class='NSMutableArray']/object[@class='NSSegmentItem']">
                    "<xsl:value-of select="string[@key='NSSegmentItemLabel']" />",
                </xsl:for-each>
                ]
        }),
    </xsl:template>
    
    <xsl:template name="NSSlider">
           <xsl:param name="node" />

           SC.SliderView.design({        
               <xsl:call-template name="LayoutFromFrame">
                               <xsl:with-param name="node" select="$node"/>
                   <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
               </xsl:call-template>
               <xsl:call-template name="KeyValuePropertiesForObject">
                   <xsl:with-param name="objectId" select="$node/@id"/>
               </xsl:call-template>
               minimum:<xsl:value-of select="./object[@class='NSSliderCell']/double[@key='NSMinValue']"/>,
               maximum:<xsl:value-of select="./object[@class='NSSliderCell']/double[@key='NSMaxValue']"/>,
               value:<xsl:value-of select="./object[@class='NSSliderCell']/double[@key='NSValue']"/>,
               steps:<xsl:value-of select="./object[@class='NSSliderCell']/double[@key='NSAltIncValue']"/>,
           }),
    </xsl:template>

    <xsl:template name="NSOutlineView">
        <xsl:param name="node" />
        SC.SourceListView.design({
            <xsl:call-template name="LayoutFromFrame">
                <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            <xsl:call-template name="exampleView">
                <xsl:with-param name="node" select="$node"/>
            </xsl:call-template>
        }),
    </xsl:template>
    
    <xsl:template name="NSCollectionView">
        <xsl:param name="node" />
        SC.ListView.design({
            <xsl:call-template name="LayoutFromFrame">
                            <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            <xsl:call-template name="exampleView">
                <xsl:with-param name="node" select="$node"/>
            </xsl:call-template>
        }),
    </xsl:template>
    
    <xsl:template name="exampleView">
        <xsl:param name="node"/>
        <xsl:for-each select="//object[@key='IBDocument.Objects']/*[@key='connectionRecords']/*/*[@class='IBOutletConnection']">
        <xsl:if test="./reference[@key='source']/@ref = $node/@id and ./string[@key='label'] = 'itemPrototype'">
            <xsl:variable name="destinationId" select="./reference[@key='destination']/@ref"/>
            <xsl:variable name="customClassId">
                <xsl:for-each select="//object[@key='IBDocument.Objects']/*[@key='objectRecords']/*/*[@class='IBObjectRecord']">
                    <xsl:if test="$destinationId = ./reference[@key='object']/@ref"><xsl:value-of select="./int[@key='objectID']"/>.CustomClassName</xsl:if>
                </xsl:for-each>
            </xsl:variable>
            <xsl:if test="$customClassId and //object[@key='IBDocument.Objects']/*[@key='flattenedProperties']/string[@key=$customClassId]">
                exampleView: <xsl:value-of select="$namespace"/>.<xsl:value-of select="//object[@key='IBDocument.Objects']/*[@key='flattenedProperties']/string[@key=$customClassId]"/>
            </xsl:if>
        </xsl:if>
       </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="NSScrollView">
        <xsl:param name="node" />
        SC.ScrollView.design({
            <xsl:call-template name="LayoutFromFrame">
                            <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            contentView: <xsl:call-template name="ProcessNodes">
                <xsl:with-param name="nodes" select="$node/*[@key='NSSubviews']/object[1]"/>
            </xsl:call-template>
        }),
    </xsl:template>

    <xsl:template name="WebView">
        <xsl:param name="node" />

        SC.WebView.design({        
            <xsl:call-template name="LayoutFromFrame">
                            <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            value:
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
        }),
    </xsl:template>

    <xsl:template name="NSMatrix">
        <xsl:param name="node" />
        SC.RadioView.design({
            <xsl:call-template name="LayoutFromFrame">
                            <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>            
            items: [
                <xsl:for-each select="$node/object[@class='NSMutableArray']/object[@class='NSButtonCell']">
                    "<xsl:value-of select="string[@key='NSContents']" />",
                </xsl:for-each>
                ]
        }),
    </xsl:template>

    <xsl:template name="NSTabView">
        <xsl:param name="node" />
        SC.TabView.design({
            itemTitleKey: "title",
            itemValueKey: "value",
            <xsl:call-template name="LayoutFromFrame">
                            <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            <xsl:variable name="tabPages">
            <xsl:for-each select="$node/*[@key='NSTabViewItems']/*[@class='NSTabViewItem']">
                    <tabPage>
                        <label>
                            <xsl:value-of select="string[@key='NSLabel']" />
                        </label>
                        <pageName>
                            <xsl:value-of select="concat(
                                    $namespace,
                                    '._',
                                    ./@id)"/>
                        </pageName>
                        <xsl:copy-of select="./*[@class='NSView']"/>
                    </tabPage>
            </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="selectedTab">
                <xsl:value-of select="concat(
                        $namespace,
                        '._',
                        ./reference[@key='NSSelectedTabViewItem']/@ref)"/>
            </xsl:variable>            
            nowShowing: "<xsl:value-of select="$selectedTab"/>.mainView",
            items: [
                <xsl:for-each select="exsl:node-set($tabPages)/tabPage">
                    {
                        title: "<xsl:value-of select="./label"/>",
                        value: "<xsl:value-of select="./pageName"/>.mainView"
                    },
                </xsl:for-each>
                ],
        }),
    </xsl:template>
    
    <xsl:template name="NSTableView">
        <xsl:param name="node" />
        SC.TableView.design({
            <xsl:call-template name="LayoutFromFrame">
                            <xsl:with-param name="node" select="$node"/>
                <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
            </xsl:call-template>
            <xsl:call-template name="KeyValuePropertiesForObject">
                <xsl:with-param name="objectId" select="$node/@id"/>
            </xsl:call-template>
            <xsl:variable name="tableColumns">
            <xsl:for-each select="$node/*[@key='NSTableColumns']/*[@class='NSTableColumn']">
                    <tableColumn>
                        <label>
                            <xsl:value-of select="*[@class='NSTableHeaderCell']/string[@key='NSContents']" />
                        </label>
                        <width>
                            <xsl:value-of select="double[@key='NSWidth']" />
                        </width>
                        <nodeid>
                            <xsl:value-of select="./@id"/>
                        </nodeid>
                        <identifier>
                            <xsl:value-of select="./string[@key='NSIdentifier']" />
                        </identifier>
                    </tableColumn>
            </xsl:for-each>
            </xsl:variable>
            columns: [
                <xsl:for-each select="exsl:node-set($tableColumns)/tableColumn">
                    SC.TableColumn.create({
                        label: "<xsl:value-of select="./label"/>",
                        key: "<xsl:value-of select="./identifier"/>",
                        width: <xsl:value-of select="./width"/>,
                        <xsl:call-template name="KeyValuePropertiesForObject">
                            <xsl:with-param name="objectId" select="./nodeid"/>
                        </xsl:call-template>
                    }),
                </xsl:for-each>
                ],
        }),
    </xsl:template>
    
    <xsl:template name="NSBox">
        <xsl:param name="node" />
        
        <xsl:choose>
            <xsl:when test="$node/int[@key='NSBoxType'] = 2">
                SC.SeparatorView.design({
                    layoutDirection: SC.LAYOUT_HORIZONTAL,
            </xsl:when>
            <xsl:when test="$node/int[@key='NSBoxType'] = 1">
                SC.SeparatorView.design({
                    layoutDirection: SC.LAYOUT_VERTICAL,
            </xsl:when>
            <xsl:when test="$node/int[@key='NSBoxType'] = 0">
                SC.ContainerView.design({
                    classNames: ["sc-view","sc-tab-view"],
                    contentView: SC.View.design({
                        classNames: ["sc-view", "sc-container-view", "sc-black-border"],
                        childViews: [
                        <xsl:for-each select="$node/*[@key='NSSubviews']/object">
                            <xsl:call-template name="ProcessNodes">
                                <xsl:with-param name="nodes" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                        ]
                    }),
            </xsl:when>
        </xsl:choose>
        <xsl:call-template name="LayoutFromFrame">
            <xsl:with-param name="node" select="$node"/>
            <xsl:with-param name="parentNodeRefId" select="$node/reference[@key='NSSuperview']/@ref"/>
        </xsl:call-template>
        <xsl:call-template name="KeyValuePropertiesForObject">
            <xsl:with-param name="objectId" select="$node/@id"/>
        </xsl:call-template>
                }),
    </xsl:template>
    
    <xsl:template name="NSClipView">
        <xsl:param name="node" />
        <xsl:call-template name="ProcessNodes">
            <xsl:with-param name="nodes" select="$node/*[@key='NSSubviews']/object[1]"/>
        </xsl:call-template>
    </xsl:template>
        
    <!-- utils -->

    <xsl:template name="str:split">
    	<xsl:param name="string" select="''" />
      <xsl:param name="pattern" select="' '" />
      <xsl:choose>
        <xsl:when test="not($string)" />
        <xsl:when test="not($pattern)">
          <xsl:call-template name="str:_split-characters">
            <xsl:with-param name="string" select="$string" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="str:_split-pattern">
            <xsl:with-param name="string" select="$string" />
            <xsl:with-param name="pattern" select="$pattern" />
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>

    <xsl:template name="str:_split-characters">
      <xsl:param name="string" />
      <xsl:if test="$string">
        <token><xsl:value-of select="substring($string, 1, 1)" /></token>
        <xsl:call-template name="str:_split-characters">
          <xsl:with-param name="string" select="substring($string, 2)" />
        </xsl:call-template>
      </xsl:if>
    </xsl:template>

    <xsl:template name="str:_split-pattern">
      <xsl:param name="string" />
      <xsl:param name="pattern" />
      <xsl:choose>
        <xsl:when test="contains($string, $pattern)">
          <xsl:if test="not(starts-with($string, $pattern))">
            <token><xsl:value-of select="substring-before($string, $pattern)" /></token>
          </xsl:if>
          <xsl:call-template name="str:_split-pattern">
            <xsl:with-param name="string" select="substring-after($string, $pattern)" />
            <xsl:with-param name="pattern" select="$pattern" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <token><xsl:value-of select="$string" /></token>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>

    <xsl:template name="str:replace">
    	<xsl:param name="string" select="''" />
       <xsl:param name="search" select="/.." />
       <xsl:param name="replace" select="/.." />
       <xsl:choose>
          <xsl:when test="not($string)" />
          <xsl:when test="not($search)">
            <xsl:value-of select="$string" />
          </xsl:when>
          <xsl:when test="function-available('exsl:node-set')">
             <!-- this converts the search and replace arguments to node sets
                  if they are one of the other XPath types -->
             <xsl:variable name="search-nodes-rtf">
               <xsl:copy-of select="$search" />
             </xsl:variable>
             <xsl:variable name="replace-nodes-rtf">
               <xsl:copy-of select="$replace" />
             </xsl:variable>
             <xsl:variable name="replacements-rtf">
                 <xsl:choose>
                     <xsl:when test="count(exsl:node-set($search-nodes-rtf)) &gt; 1">
                         <xsl:for-each select="exsl:node-set($search-nodes-rtf)/node()">
                             <xsl:variable name="pos" select="position()"/>
                             <replace search="{.}">
                                 <xsl:copy-of select="exsl:node-set($replace-nodes-rtf)/node()[$pos]"/>
                             </replace>
                         </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                         <replace search="{$search}">
                             <xsl:copy-of select="$replace-nodes-rtf"/>
                         </replace>
                     </xsl:otherwise>
                 </xsl:choose>
             </xsl:variable>
             <xsl:variable name="sorted-replacements-rtf">
                <xsl:for-each select="exsl:node-set($replacements-rtf)/replace">
                   <xsl:sort select="string-length(@search)" data-type="number" order="descending" />
                   <xsl:copy-of select="." />
                </xsl:for-each>
             </xsl:variable>
             <xsl:call-template name="str:_replace">
                <xsl:with-param name="string" select="$string" />
                <xsl:with-param name="replacements" select="exsl:node-set($sorted-replacements-rtf)/replace" />
             </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
             <xsl:message terminate="yes">
                ERROR: template implementation of str:replace relies on exsl:node-set().
             </xsl:message>
          </xsl:otherwise>
       </xsl:choose>
    </xsl:template>

    <xsl:template name="str:_replace">
      <xsl:param name="string" select="''" />
      <xsl:param name="replacements" select="/.." />
      <xsl:choose>
        <xsl:when test="not($string)" />
        <xsl:when test="not($replacements)">
          <xsl:value-of select="$string" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="replacement" select="$replacements[1]" />
          <xsl:variable name="search" select="$replacement/@search" />
          <xsl:choose>
            <xsl:when test="not(string($search))">
              <xsl:value-of select="substring($string, 1, 1)" />
              <xsl:copy-of select="$replacement/node()" />
              <xsl:call-template name="str:_replace">
                <xsl:with-param name="string" select="substring($string, 2)" />
                <xsl:with-param name="replacements" select="$replacements" />
              </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($string, $search)">
              <xsl:call-template name="str:_replace">
                <xsl:with-param name="string" select="substring-before($string, $search)" />
                <xsl:with-param name="replacements" select="$replacements[position() > 1]" />
              </xsl:call-template>      
              <xsl:copy-of select="$replacement/node()" />
              <xsl:call-template name="str:_replace">
                <xsl:with-param name="string" select="substring-after($string, $search)" />
                <xsl:with-param name="replacements" select="$replacements" />
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="str:_replace">
                <xsl:with-param name="string" select="$string" />
                <xsl:with-param name="replacements" select="$replacements[position() > 1]" />
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>

</xsl:stylesheet>