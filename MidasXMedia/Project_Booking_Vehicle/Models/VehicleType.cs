using System;
using System.Collections.Generic;

namespace MidasXMedia.Models
{
    public partial class VehicleType
    {
        public VehicleType()
        {
            Vehicles = new HashSet<Vehicle>();
        }

        public int TypeId { get; set; }
        public string TypeName { get; set; } = null!;

        public virtual ICollection<Vehicle> Vehicles { get; set; }
    }
}
