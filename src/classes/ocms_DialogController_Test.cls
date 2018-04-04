@isTest
private class ocms_DialogController_Test {
    static ocms_DialogController controller;
    static cms.TestControllerFactory testFactory;

    static void setup() {
        controller = new ocms_DialogController();
        testFactory = new cms.TestControllerFactory(controller);
    }

    @isTest static void ocms_DialogControllerTest() {
        setup();

        testFactory.addContentProperty('dialogBody', 'Test Dialog Body');
        System.assertEquals('Test Dialog Body', controller.dialogBody, 'dialogBody accessor returns the stored value.');

        testFactory.addContentProperty('dialogId', 'Test Dialog ID');
        System.assertEquals('Test Dialog ID', controller.dialogId, 'dialogId accessor returns the stored value.');

        testFactory.addContentProperty('dialogTitle', 'Test Dialog Title');
        System.assertEquals('Test Dialog Title', controller.dialogTitle, 'dialogTitle accessor returns the stored value.');

        testFactory.addContentProperty('closeOnEscape', 'false');
        System.assertEquals(false, controller.closeOnEscape, 'closeOnEscape accessor returns the stored value.');

        testFactory.addContentProperty('closeOnOverlay', 'false');
        System.assertEquals(false, controller.closeOnOverlay, 'closeOnOverlay accessor returns the stored value.');

        String html = controller.getHtml();
        System.assert(String.isNotBlank(html), 'getHTML method returns a value');
        

    }

}