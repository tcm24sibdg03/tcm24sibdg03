import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {AutoshopDataSource} from '../datasources';
import {Historico, HistoricoRelations, Veiculo, Agendamento} from '../models';
import {VeiculoRepository} from './veiculo.repository';
import {AgendamentoRepository} from './agendamento.repository';

export class HistoricoRepository extends DefaultCrudRepository<
  Historico,
  typeof Historico.prototype.id,
  HistoricoRelations
> {

  public readonly veiculo: BelongsToAccessor<Veiculo, typeof Historico.prototype.id>;

  public readonly agendamento: BelongsToAccessor<Agendamento, typeof Historico.prototype.id>;

  constructor(
    @inject('datasources.autoshop') dataSource: AutoshopDataSource, @repository.getter('VeiculoRepository') protected veiculoRepositoryGetter: Getter<VeiculoRepository>, @repository.getter('AgendamentoRepository') protected agendamentoRepositoryGetter: Getter<AgendamentoRepository>,
  ) {
    super(Historico, dataSource);
    this.agendamento = this.createBelongsToAccessorFor('agendamento', agendamentoRepositoryGetter,);
    this.registerInclusionResolver('agendamento', this.agendamento.inclusionResolver);
    this.veiculo = this.createBelongsToAccessorFor('veiculo', veiculoRepositoryGetter,);
    this.registerInclusionResolver('veiculo', this.veiculo.inclusionResolver);
  }
}
