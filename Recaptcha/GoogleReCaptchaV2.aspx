<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoogleReCaptchaV2.aspx.cs" Inherits="Recaptcha.GoogleReCaptchaV2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>reCAPTCHA Demo</title>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

    <script>
        function onSubmit(token) {
            // Handle the token, for example, send it to your server for verification.
            console.log(token);
            // Now, you can proceed with your form submission logic.
            __doPostBack('<%= SubmitButton.UniqueID %>', '');
        }

        var onRecaptchaLoad = function () {
            grecaptcha.render('yourRecaptchaContainer', {
                'sitekey': '6Lf1rJApAAAAAGOQpCgo-gEiLJZ3psjrCzQK2Y-V',
                'theme': 'light', // You can customize the theme
                'type': 'image', // Set the type to "image"
                'callback': onSubmit // Specify the callback function
                // Add other optional parameters here
            });
        };
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <!-- Other form elements -->
        <h2>Google Capture V2 Demo</h2>

        <div class="g-recaptcha" data-sitekey="6Lf1rJApAAAAAGOQpCgo-gEiLJZ3psjrCzQK2Y-V" data-callback="onSubmit" data-type="image"></div>
        <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" style="display: flex;"/>
    </form>
</body>
</html>
