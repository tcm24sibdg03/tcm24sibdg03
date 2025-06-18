import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {AutoshopDataSource} from '../datasources';
import {Inclui, IncluiRelations} from '../models';

export class IncluiRepository extends DefaultCrudRepository<
  Inclui,
  {agendamentoId: number; servicoId: number},
  IncluiRelations
> {
  constructor(
    @inject('datasources.autoshop') dataSource: AutoshopDataSource,
  ) {
    super(Inclui, dataSource);
  }
}
