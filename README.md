SCXIB - Interface Builder for the Web
=====================================

SCXIB (pronounced ska-zib) grew out of the desire to use Interface Builder
as a design tool for SproutCore applications.

[View the Demo Video]

## How to use SCXIB

### On-the-fly Application Loading

Transform XIB files for your SproutCore application to load and use during development:

    SCXIB.loadXibWithOptions(sc_static('MainPage.xib'), {
      namespace: DemoApp.NAMESPACE,
      pageName: 'mainPage',
      callback: function () {
        DemoApp.getPath('mainPage.mainPane').append();
      }
    });

### XIB to JavaScript

Transform a XIB file into a JavaScript file for your SproutCore application
using a command line tool:
    ./bin/scxib -namespace DemoApp -page mainPage apps/demo_app/resources/MainPage.xib

## Requirements

  - Interface Builder for XCode 3.2.x
  - SproutCore

## Current Class Mappings

  - NSWindow -> SC.Page
  - NSPanel -> SC.Panel
  - NSView -> SC.View
  - NSCustomView -> your app's custom view name
  - NSLabel -> SC.LabelView
  - NSTextField -> SC.TextFieldView
  - NSSplitView -> SC.SplitView
  - IKImageView -> SC.ImageView
  - NSCheckBox -> SC.CheckBoxView
  - NSButton -> SC.ButtonView
  - NSPopUpButton -> SC.SelectFieldView
  - NSSegmentedControl -> SC.SegmentedView
  - NSCollectionView -> SC.SourceListView
  - NSScrollView -> SC.ScrollView
  - NSWebView -> SC.WebView
  - NSMatrix -> SC.RadioView
  - NSTabView -> SC.TabView
  - NSBox Horizontal/Vertical -> SC.SeparatorView:layoutDirection SC.LAYOUT\_HORIZONTAL/SC.LAYOUT\_VERTICAL

[View the Demo Video]: http://vimeo.com/
