using System;
using DevExpress.Xpo;
using DevExpress.Xpo.DB;
using DevExpress.ExpressApp;
using DevExpress.ExpressApp.DC;
using DevExpress.Data.Filtering;
using DevExpress.ExpressApp.Reports;

namespace credencial
{
    [DomainComponent]
    // For more typical usage scenarios, be sure to check out https://documentation.devexpress.com/eXpressAppFramework/CustomDocument112778.aspx.
    public class prueba : ReportParametersObjectBase
    {
        public prueba(IObjectSpace objectSpace, Type reportDataType) : base(objectSpace, reportDataType) { }
        public override CriteriaOperator GetCriteria()
        {
            CriteriaOperator criteria = new BinaryOperator("MyPropertyName", "MyValue");
            return criteria;
        }
        public override SortProperty[] GetSorting()
        {
            SortProperty[] sorting = { new SortProperty("MyPropertyName", SortingDirection.Descending) };
            return sorting;
        }
    }
}
