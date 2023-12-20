namespace PetsService.Infrastructure;

using AutoMapper;
using PetsService.Domain;

public class MapperProfile : Profile
{
  public MapperProfile()
  {
    this.CreateMap<OrganizationView, Organization>();
    this.CreateMap<ContractView, Contract>();
    this.CreateMap<ContractCostView, ContractCost>();
    this.CreateMap<CatchActView, CatchAct>();
    this.CreateMap<CatchActCardView, CatchActCard>();
  }
}
