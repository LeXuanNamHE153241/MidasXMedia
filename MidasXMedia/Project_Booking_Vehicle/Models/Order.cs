using System;
using System.Collections.Generic;

namespace MidasXMedia.Models
{
    public partial class Order
    {
        public Order()
        {
            Reviews = new HashSet<Review>();
        }

        public int OrderId { get; set; }
        public int? UserId { get; set; }
        public int? VehicleId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public decimal TotalAmount { get; set; }
        public string Status { get; set; } = null!;
        public string? Stdate { get; set; }
        public string? Endate { get; set; }

        public virtual User? User { get; set; }
        public virtual Vehicle? Vehicle { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
