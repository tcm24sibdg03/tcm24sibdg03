import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  get,
  param,
  response,
} from '@loopback/rest';
import {Historico} from '../models';
import {HistoricoRepository} from '../repositories';
import {getModelSchemaRef} from '@loopback/rest';

export class HistoricoController {
  constructor(
    @repository(HistoricoRepository)
    public historicoRepository: HistoricoRepository,
  ) {}

  @get('/historicos')
  @response(200, {
    description: 'Lista completa do histórico',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Historico, {includeRelations: true}),
        },
      },
    },
  })
  async findAll(): Promise<Historico[]> {
    return this.historicoRepository.find();
  }

  @get('/historicos/veiculo/{veiculoId}')
  @response(200, {
    description: 'Lista de históricos por veículo',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Historico, {includeRelations: true}),
        },
      },
    },
  })
  async findByVeiculoId(
    @param.path.number('veiculoId') veiculoId: number,
  ): Promise<Historico[]> {
    return this.historicoRepository.find({
      where: {veiculoId},
    });
  }
}