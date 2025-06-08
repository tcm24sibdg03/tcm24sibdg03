import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {AutoshopDataSource} from '../datasources';
import {Servico, ServicoRelations} from '../models';

export class ServicoRepository extends DefaultCrudRepository<
  Servico,
  typeof Servico.prototype.id,
  ServicoRelations
> {
  constructor(
    @inject('datasources.autoshop') dataSource: AutoshopDataSource,
  ) {
    super(Servico, dataSource);
  }
}
