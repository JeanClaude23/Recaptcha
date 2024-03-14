using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Recaptcha
{
    public partial class GoogleReCaptchaV2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if (ValidateRecaptcha())
            {
                Response.Write("Form submitted successfully!");
            }
            else
            {
                Response.Write("reCAPTCHA validation failed. Please try again.");
            }
        }
        private bool ValidateRecaptcha()
        {
            string secretKey = "6Lf1rJApAAAAAD1EStw2Po_uxIVv9ILvnp4eFbfW";
            string response = Request.Form["g-recaptcha-response"];

            using (WebClient wc = new WebClient())
            {
                string result = wc.DownloadString($"https://www.google.com/recaptcha/api/siteverify?secret={secretKey}&response={response}");
                dynamic jsonResult = JsonConvert.DeserializeObject(result);
                return jsonResult.success;
            }
        }


        private class RecaptchaResponse
        {
            public bool Success { get; set; }
        }
    }
}