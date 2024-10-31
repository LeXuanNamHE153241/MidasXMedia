using Microsoft.Data.SqlClient;

using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Net;
using System.Net.Mail;
using System.Reflection;
using System.Security.Principal;
using System.Text;

using System.Net.Mail;

using System.Text.RegularExpressions;
using MidasXMedia.Models;



namespace TravelSystem_SWP391.DAO_Context
{
    public class DAO
    {
        DBvehicleContext context = new DBvehicleContext();

        public User Login(string userName, string pass)
        {
            try
            {
                User account = context.Users.Where(x => x.Username.Trim().ToLower().Equals(userName.Trim().ToLower()) == true && x.Password.Trim().ToLower().Equals(pass.Trim().ToLower()) == true).FirstOrDefault();
                if (account != null)
                {
                    return account;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                return null;
            }

        }
		public Vehicle VehicleByID(string id)
		{
			try
			{
				Vehicle v = context.Vehicles.Include(s=>s.Type).Where(x => x.VehicleId== Int32.Parse(id)&&x.TypeId==x.Type.TypeId).FirstOrDefault();
				if (v != null)
				{
					return v;
				}
				else
				{
					return null;
				}
			}
			catch
			{
				return null;
			}

		}









		public bool IsEmail(string email)
        {
            try
            {
                MailAddress m = new MailAddress(email);
                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }

        public bool IsPhoneNumberValidVietnam(string phoneNumber)
        {
            // Define a regular expression pattern for Vietnamese phone numbers
            // This pattern assumes the country code is +84 and follows the format 10 digits after that.
            string pattern = @"^0[0-9]{9}$";

            // Use Regex.IsMatch to check if the phone number matches the pattern
            return Regex.IsMatch(phoneNumber, pattern);
        }
        public bool IsEmailValid(string emailAddress)
        {
            // Define a regular expression pattern for a basic email address format
            // This is a simplified pattern and may not cover all edge cases
            string pattern = @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";

            // Use Regex.IsMatch to check if the email address matches the pattern
            return Regex.IsMatch(emailAddress, pattern);
        }
        public Boolean ChangePass(User account, string newPass)
        {
            try
            {
                User a = context.Users.Where(x => x.Email == account.Email.Trim() && x.Password == account.Password.Trim()).FirstOrDefault();
                a.Password = newPass;
                context.SaveChanges();
                return true;
            }
            catch
            {
            }
            return false;
        }
       

        public User getUser(string Email)
        {
            try
            {
                User users = context.Users.Where(x => x.Email == Email).FirstOrDefault();
                if (users != null)
                {
                    return users;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                return null;
            }

        }
        


        public bool IsValidFirstnameorLastname(string name)
        {
            // You can add your validation rules here.
            // Example: Check if the firstname is not empty and contains only letters.
            return !string.IsNullOrWhiteSpace(name) && IsAlphaOnly(name);
        }

        public bool IsAlphaOnly(string input)
        {
            // Check if the input string contains only letters.
            foreach (char c in input)
            {
                if (!char.IsLetter(c))
                {
                    return false;
                }
            }
            return true;
        }
      




       

       
       
        public User GetUserByEmail(string userEmail)
        {
            var users = context.Users.FirstOrDefault(us => us.Email.ToLower().Equals(userEmail.ToLower()));
            return users;
        }

      

      

    }
}

