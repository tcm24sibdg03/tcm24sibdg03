import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {AutoshopDataSource} from '../datasources';
import {Cliente, ClienteRelations, Veiculo} from '../models';
import {VeiculoRepository} from './veiculo.repository';

export class ClienteRepository extends DefaultCrudRepository<
  Cliente,
  typeof Cliente.prototype.id,
  ClienteRelations
> {

  public readonly veiculos: HasManyRepositoryFactory<Veiculo, typeof Cliente.prototype.id>;

  constructor(
    @inject('datasources.autoshop') dataSource: AutoshopDataSource, @repository.getter('VeiculoRepository') protected veiculoRepositoryGetter: Getter<VeiculoRepository>,
  ) {
    super(Cliente, dataSource);
    this.veiculos = this.createHasManyRepositoryFactoryFor('veiculos', veiculoRepositoryGetter,);
    this.registerInclusionResolver('veiculos', this.veiculos.inclusionResolver);
  }
}
