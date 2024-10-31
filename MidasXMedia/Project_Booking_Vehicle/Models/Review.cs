using System;
using System.Collections.Generic;

namespace MidasXMedia.Models
{
    public partial class Review
    {
        public int ReviewId { get; set; }
        public int? OrderId { get; set; }
        public int Rating { get; set; }
        public string? Comment { get; set; }
        public DateTime ReviewDate { get; set; }
        public int? UserId { get; set; }
        public int? VehicleId { get; set; }

        public virtual Order? Order { get; set; }
        public virtual User? User { get; set; }
        public virtual Vehicle? Vehicle { get; set; }
    }
}
