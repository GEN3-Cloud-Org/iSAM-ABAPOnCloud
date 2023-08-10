@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zview1'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zview1 as select from /dmo/customer as customer

association[1] to I_Country as _Country

on $projection.CountryCode = _Country.Country

{

   key customer.customer_id as CustomerId,

   concat(concat(title, concat(' ', first_name)), concat(' ',last_name)) as CustomerName,

   customer.city as City,

   customer.country_code as CountryCode,

   customer.phone_number as PhoneNumber,

   customer.email_address as EmailAddress,

   _Country

}
