using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class CivilitesController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/Civilites
        public IQueryable<Civilite> GetCivilites()
        {
            return db.Civilites;
        }

        // GET: api/Civilites/5
        [ResponseType(typeof(Civilite))]
        public IHttpActionResult GetCivilite(int id)
        {
            Civilite civilite = db.Civilites.Find(id);
            if (civilite == null)
            {
                return NotFound();
            }

            return Ok(civilite);
        }

        // PUT: api/Civilites/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutCivilite(int id, Civilite civilite)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != civilite.id_civilite)
            {
                return BadRequest();
            }

            db.Entry(civilite).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CiviliteExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Civilites
        [ResponseType(typeof(Civilite))]
        public IHttpActionResult PostCivilite(Civilite civilite)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Civilites.Add(civilite);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = civilite.id_civilite }, civilite);
        }

        // DELETE: api/Civilites/5
        [ResponseType(typeof(Civilite))]
        public IHttpActionResult DeleteCivilite(int id)
        {
            Civilite civilite = db.Civilites.Find(id);
            if (civilite == null)
            {
                return NotFound();
            }

            db.Civilites.Remove(civilite);
            db.SaveChanges();

            return Ok(civilite);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CiviliteExists(int id)
        {
            return db.Civilites.Count(e => e.id_civilite == id) > 0;
        }
    }
}