//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ManagementApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employee()
        {
            this.Salary = new HashSet<Salary>();
        }
    
        public int Id { get; set; }
        public int IdAltelier { get; set; }
        public string EmployeeName { get; set; }
        public Nullable<bool> Dorm { get; set; }
        public Nullable<bool> SecuSocial { get; set; }
        public Nullable<bool> HouseAccumulation { get; set; }
        public Nullable<bool> ExperiencedOfficial { get; set; }
    
        public virtual Altelier Altelier { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Salary> Salary { get; set; }
    }
}
