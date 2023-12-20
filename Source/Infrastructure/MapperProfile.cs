namespace PetsService.Infrastructure;

using AutoMapper;
using PetsService.Domain;

public class MapperProfile : Profile
{
  public MapperProfile()
  {
    CreateMap<OrganizationView, Organization>();
  }
}
