import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {AutoshopDataSource} from '../datasources';
import {Inclui, IncluiRelations, Agendamento, Servico} from '../models';
import {AgendamentoRepository} from './agendamento.repository';
import {ServicoRepository} from './servico.repository';

export class IncluiRepository extends DefaultCrudRepository<
  Inclui,
  {agendamentoId: number; servicoId: number},
  IncluiRelations
> {

  public readonly agendamento: BelongsToAccessor<Agendamento, typeof Inclui.prototype.agendamentoId>;
  public readonly servico: BelongsToAccessor<Servico, typeof Inclui.prototype.servicoId>;

  constructor(
    @inject('datasources.autoshop') dataSource: AutoshopDataSource, @repository.getter('AgendamentoRepository') protected agendamentoRepositoryGetter: Getter<AgendamentoRepository>, @repository.getter('ServicoRepository') protected servicoRepositoryGetter: Getter<ServicoRepository>,
  ) {
    super(Inclui, dataSource);
    this.servico = this.createBelongsToAccessorFor('servico', servicoRepositoryGetter) as unknown as BelongsToAccessor<Servico, number>;
    this.registerInclusionResolver('servico', this.servico.inclusionResolver);
    this.agendamento = this.createBelongsToAccessorFor('agendamento', agendamentoRepositoryGetter) as unknown as BelongsToAccessor<Agendamento, number>;
    this.registerInclusionResolver('agendamento', this.agendamento.inclusionResolver);
  }
}
