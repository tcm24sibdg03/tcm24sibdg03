import {inject, Getter} from '@loopback/core';
import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {AutoshopDataSource} from '../datasources';
import {Veiculo, VeiculoRelations, Agendamento, Historico} from '../models';
import {AgendamentoRepository} from './agendamento.repository';
import {HistoricoRepository} from './historico.repository';

export class VeiculoRepository extends DefaultCrudRepository<
  Veiculo,
  typeof Veiculo.prototype.id,
  VeiculoRelations
> {

  public readonly agendamentos: HasManyRepositoryFactory<Agendamento, typeof Veiculo.prototype.id>;

  public readonly historicos: HasManyRepositoryFactory<Historico, typeof Veiculo.prototype.id>;

  constructor(
    @inject('datasources.autoshop') dataSource: AutoshopDataSource, @repository.getter('AgendamentoRepository') protected agendamentoRepositoryGetter: Getter<AgendamentoRepository>, @repository.getter('HistoricoRepository') protected historicoRepositoryGetter: Getter<HistoricoRepository>,
  ) {
    super(Veiculo, dataSource);
    this.historicos = this.createHasManyRepositoryFactoryFor('historicos', historicoRepositoryGetter,);
    this.registerInclusionResolver('historicos', this.historicos.inclusionResolver);
    this.agendamentos = this.createHasManyRepositoryFactoryFor('agendamentos', agendamentoRepositoryGetter,);
    this.registerInclusionResolver('agendamentos', this.agendamentos.inclusionResolver);
  }
}
