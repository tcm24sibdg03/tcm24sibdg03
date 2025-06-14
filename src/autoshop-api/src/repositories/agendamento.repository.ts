import {inject, Getter} from '@loopback/core';
import {
  DefaultCrudRepository,
  repository,
  HasManyThroughRepositoryFactory,
} from '@loopback/repository';
import {AutoshopDataSource} from '../datasources';
import {
  Agendamento,
  AgendamentoRelations,
  Servico,
  Inclui,
} from '../models';
import {ServicoRepository} from './servico.repository';
import {IncluiRepository} from './inclui.repository';

export class AgendamentoRepository extends DefaultCrudRepository<
  Agendamento,
  typeof Agendamento.prototype.id,
  AgendamentoRelations
> {
  public readonly servicos: HasManyThroughRepositoryFactory<
    Servico,
    typeof Servico.prototype.id,
    Inclui,
    typeof Agendamento.prototype.id
  >;

  constructor(
    @inject('datasources.autoshop') dataSource: AutoshopDataSource,
    @repository.getter('ServicoRepository') getServico: Getter<ServicoRepository>,
    @repository.getter('IncluiRepository') getInclui: Getter<IncluiRepository>,
  ) {
    super(Agendamento, dataSource);

    this.servicos = this.createHasManyThroughRepositoryFactoryFor(
      'servicos',
      getServico,
      getInclui,
    );
    this.registerInclusionResolver('servicos', this.servicos.inclusionResolver);
  }
}
