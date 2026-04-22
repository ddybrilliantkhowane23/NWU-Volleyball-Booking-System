using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VolleyballBooking
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    // Highlight current date on calendar
                    calBooking.SelectedDate = DateTime.Today;
                    calBooking.VisibleDate = DateTime.Today;
                    calBooking.SelectedDates.Clear();
                    calBooking.SelectedDate = DateTime.Today;
                    divConfirmation.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error in Page_Load: " + ex.Message);
            }
        }

        // Validate that selected date is Monday or Friday
        protected void calBooking_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                DateTime selected = calBooking.SelectedDate;
                if (selected.DayOfWeek != DayOfWeek.Monday && selected.DayOfWeek != DayOfWeek.Friday)
                {
                    lblDateError.Text = "Bookings are only allowed on Mondays and Fridays. Please select a different date.";
                    lblDateError.Visible = true;
                    calBooking.SelectedDate = DateTime.Today; // reset
                }
                else
                {
                    lblDateError.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error in calBooking_SelectionChanged: " + ex.Message);
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate date again (in case user bypassed client-side)
                if (calBooking.SelectedDate.DayOfWeek != DayOfWeek.Monday &&
                    calBooking.SelectedDate.DayOfWeek != DayOfWeek.Friday)
                {
                    lblDateError.Text = "Please select a Monday or Friday for your booking.";
                    lblDateError.Visible = true;
                    return;
                }

                if (Page.IsValid)
                {
                    string name = txtName.Text;
                    string surname = txtSurname.Text;
                    string campus = rblCampus.SelectedItem.Value;

                    // Calculate class date and time slot based on campus
                    DateTime bookingDate = calBooking.SelectedDate;
                    DateTime classDate;
                    string timeSlot = "";

                    switch (campus)
                    {
                        case "Mahikeng":
                            classDate = bookingDate.AddDays(8);
                            timeSlot = "10:00am – 12:00pm";
                            break;
                        case "Potchefstroom":
                            classDate = bookingDate.AddDays(4);
                            timeSlot = "11:00am – 1:00pm";
                            break;
                        case "Vanderbijlpark":
                            classDate = bookingDate.AddDays(6);
                            timeSlot = "08:00am – 10:00am";
                            break;
                        default:
                            classDate = bookingDate;
                            break;
                    }

                    string confirmation = $"Thank you, {name} {surname}!<br />" +
                                         $"Your {campus} campus coaching class is scheduled for <strong>{classDate:dddd, MMMM dd, yyyy}</strong>.<br />" +
                                         $"Time slot: <strong>{timeSlot}</strong>.<br />" +
                                         $"A confirmation email has been sent to {txtEmail.Text}.";

                    lblConfirmation.Text = confirmation;
                    divConfirmation.Visible = true;

                    // Clear input fields for next booking
                    ClearForm();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error in btnBook_Click: " + ex.Message);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            try
            {
                ClearForm();
                divConfirmation.Visible = false;
                lblDateError.Visible = false;
                calBooking.SelectedDate = DateTime.Today;
            }
            catch (Exception ex)
            {
                Response.Write("Error in btnClear_Click: " + ex.Message);
            }
        }

        private void ClearForm()
        {
            txtName.Text = "";
            txtSurname.Text = "";
            txtEmail.Text = "";
            rblCampus.ClearSelection();
            // Keep calendar selection as today, but reset any error
            calBooking.SelectedDate = DateTime.Today;
            lblDateError.Visible = false;
        }
    }
}