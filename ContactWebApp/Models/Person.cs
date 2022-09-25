using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ContactWebApp_CRUD_.Models
{
    public class Person
    {
        public int PersonId { get; set; }
        [Required(ErrorMessage = "Please enter a First Name")]
        [DisplayName("First Name")]
        public string FirstName { get; set; }
        [DisplayName("Last Name")]
        [Required(ErrorMessage = "Please enter a Last Name")]
        public string LastName { get; set; }
        [Required(ErrorMessage = "Please enter a Phone Number")]
        [DisplayName("Phone Number")]
        public string PhoneNumber { get; set; }
        [Required(ErrorMessage = "Please enter a Email")]
        [EmailAddress(ErrorMessage = "Email is invalid")]
        public string Email { get; set; }
    }
}