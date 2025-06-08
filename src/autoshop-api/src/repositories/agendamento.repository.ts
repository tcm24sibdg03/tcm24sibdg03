import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {AutoshopDataSource} from '../datasources';
import {Agendamento, AgendamentoRelations} from '../models';

export class AgendamentoRepository extends DefaultCrudRepository<
  Agendamento,
  typeof Agendamento.prototype.id,
  AgendamentoRelations
> {
  constructor(
    @inject('datasources.autoshop') dataSource: AutoshopDataSource,
  ) {
    super(Agendamento, dataSource);
  }
}
