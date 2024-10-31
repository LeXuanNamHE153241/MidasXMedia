using System;
using System.Collections.Generic;

namespace MidasXMedia.Models
{
    public partial class Vehicle
    {
        public Vehicle()
        {
            Orders = new HashSet<Order>();
            Reviews = new HashSet<Review>();
        }

        public int VehicleId { get; set; }
        public int? TypeId { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; } 
        public int Year { get; set; }
        public string Color { get; set; } 
        public decimal DailyRate { get; set; }
        public bool Availability { get; set; }
        public string? Images { get; set; }
        public string? Describe { get; set; }
        public double? Price { get; set; }

        public virtual VehicleType? Type { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
