global virtual with sharing class ocms_DialogController extends cms.ContentTemplateController {

    global ocms_DialogController() {}
    
    global ocms_DialogController(cms.CreateContentController cc) {
        super(cc);
    }

    private Boolean getBooleanPropertyWithDefault(String property, Boolean defaultValue) {
        String value = getProperty(property);

        try {
            if (value == null) {
                return Boolean.valueOf(defaultValue);
            } else {
                return Boolean.valueOf(value);
            }
        } catch(Exception e) {
            return null;
        }
    }

    private String getStringPropertyWithDefault(String property, String defaultValue) {
        String value = getProperty(property);

        if (value == null) {
            return defaultValue;
        } else {
            return value;
        }
    }

    public String dialogBody {
        get {
            return getStringPropertyWithDefault('dialogBody', '');
        }
    }

    public String dialogId {
        get {
            return getStringPropertyWithDefault('dialogId', getOriginId());
        }
    }

    public String dialogTitle {
        get {
            return getStringPropertyWithDefault('dialogTitle', getOriginId());
        }
    }

    public Boolean closeOnEscape {
        get {
            return getBooleanPropertyWithDefault('closeOnEscape', true);
        }
    }

    public Boolean closeOnOverlay {
        get {
            return getBooleanPropertyWithDefault('closeOnOverlay', true);
        }
    }

    public virtual override String getHTML() {

        String html = '';
        String script = '';

        html += '<div data-dialog'
                    + (String.isNotBlank(dialogId) ? ' id="' + dialogId.escapeHtml4() : '') + '"'
                    + 'data-closeonescape="' + closeOnEscape + '"'
                    + 'data-closeonoverlay="' + closeOnOverlay + '"'
                    + '>'
                + dialogBody
            + '</div>';

        script += '<script>\n';
            script += '$(document).ocmsDynamicLoadFinished(function(){\n';
                script += '$(\'#' + dialogId + '\').dialog({\n';
                    script += 'closeOnEscape: ' + closeOnEscape + ',\n';
                    script += 'title: \'' + dialogTitle + '\',\n';
                    script += 'buttons: [{ text: \'Ok\', click: function() {$(this).dialog(\'close\');}}]\n';
                script += '});\n';
            script += '});\n';

        script += '</script>\n';
        return html + script;

    }
}