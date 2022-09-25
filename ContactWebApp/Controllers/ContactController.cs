using ContactWebApp_CRUD_.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;

namespace ContactWebApp_CRUD_.Controllers
{
    public class ContactController : Controller
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["ContactDBContext"].ToString();

        // GET: Contact
        public ActionResult Index()
        {
            return View(GetPeople());
        }
        // GET
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost] // POST
        public ActionResult Create([Bind(Exclude = "PersonID")] Person obj)
        {
            if (ModelState.IsValid)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("uspAddContact", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("FirstName", obj.FirstName);
                    command.Parameters.AddWithValue("LastName", obj.LastName);
                    command.Parameters.AddWithValue("PhoneNumber", obj.PhoneNumber);
                    command.Parameters.AddWithValue("Email", obj.Email);
                    connection.Open();
                    command.ExecuteNonQuery();
                }

                return RedirectToAction("Index");
            }

            return View(obj);
        }
        // GET
        public ActionResult Edit(int? id)
        {
            var person = GetPeople().FirstOrDefault(p => p.PersonId == id);

            if (person != null)
                return View(person);
            else
                return RedirectToAction("Index");
        }
        [HttpPost] // POST
        public ActionResult Edit(Person obj)
        {
            if (ModelState.IsValid)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("uspEditContact", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("PersonID", obj.PersonId);
                    command.Parameters. AddWithValue("FirstName", obj.FirstName);
                    command.Parameters.AddWithValue("LastName", obj.LastName);
                    command.Parameters.AddWithValue("PhoneNumber", obj.PhoneNumber);
                    command.Parameters.AddWithValue("Email", obj.Email);
                    connection.Open();
                    command.ExecuteNonQuery();
                }

                return RedirectToAction("Index");
            }

            return View(obj);
        }
        // GET
        public ActionResult Delete(int? id)
        {
            var person = GetPeople().FirstOrDefault(p => p.PersonId == id);

            if (person != null)
                return View(person);
            else
                return RedirectToAction("Index");
        }
        [HttpPost] // POST
        public ActionResult Delete(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("uspDeleteContact", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("PersonID", id);
                connection.Open();
                command.ExecuteNonQuery();
            }

            return RedirectToAction("Index");
        }

        [NonAction]
        public List<Person> GetPeople()
        {

            List<Person> people = new List<Person>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"SELECT * FROM [dbo].[People]";
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Person obj = new Person
                        {
                            PersonId = Convert.ToInt32(reader["PersonID"].ToString()),
                            FirstName = reader["FirstName"].ToString(),
                            LastName = reader["LastName"].ToString(),
                            PhoneNumber = reader["PhoneNumber"].ToString(),
                            Email = reader["Email"].ToString(),
                        };

                        people.Add(obj);
                    }
                }
            }

            return people;
        }
    }
}