import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
  response,
} from '@loopback/rest';
import {Agendamento} from '../models';
import {AgendamentoRepository} from '../repositories';
import {HistoricoRepository} from '../repositories';

export class AgendamentoController {
  constructor(
    @repository(AgendamentoRepository)
    public agendamentoRepository: AgendamentoRepository,
    @repository(HistoricoRepository)
    public historicoRepository: HistoricoRepository,
  ) {}

  @post('/agendamentos')
  @response(200, {
    description: 'Agendamento model instance',
    content: {'application/json': {schema: getModelSchemaRef(Agendamento)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Agendamento, {
            title: 'NewAgendamento',
            exclude: ['id'],
          }),
        },
      },
    })
    agendamento: Omit<Agendamento, 'id'>,
  ): Promise<Agendamento> {
    const novo = await this.agendamentoRepository.create(agendamento);

    await this.historicoRepository.create({
    agendamentoId: novo.id,
    veiculoId: novo.veiculoId,
    notas: `Status: ${novo.status}`,
  });
  return novo;
  }

  @get('/agendamentos/count')
  @response(200, {
    description: 'Agendamento model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(Agendamento) where?: Where<Agendamento>,
  ): Promise<Count> {
    return this.agendamentoRepository.count(where);
  }

  @get('/agendamentos')
  @response(200, {
    description: 'Array of Agendamento model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Agendamento),
        },
      },
    },
  })
  async find(): Promise<Agendamento[]> {
    return this.agendamentoRepository.find({
      include: [{relation: 'servicos'}],
    });
  }

  @patch('/agendamentos')
  @response(200, {
    description: 'Agendamento PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Agendamento, {partial: true}),
        },
      },
    })
    agendamento: Agendamento,
    @param.where(Agendamento) where?: Where<Agendamento>,
  ): Promise<Count> {
    return this.agendamentoRepository.updateAll(agendamento, where);
  }

  @get('/agendamentos/{id}')
  @response(200, {
    description: 'Agendamento model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(Agendamento),
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
  ): Promise<Agendamento> {
    return this.agendamentoRepository.findById(id, {
      include: [{relation: 'servicos'}],
    });
  }

  @patch('/agendamentos/{id}')
  @response(204, {
    description: 'Agendamento PATCH success',
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Agendamento, {partial: true}),
        },
      },
    })
    agendamento: Agendamento,
  ): Promise<void> {
    await this.agendamentoRepository.updateById(id, agendamento);
  }

  @put('/agendamentos/{id}')
  @response(204, {
    description: 'Agendamento PUT success',
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() agendamento: Agendamento,
  ): Promise<void> {
    await this.agendamentoRepository.replaceById(id, agendamento);
  }

  @del('/agendamentos/{id}')
  @response(204, {
    description: 'Agendamento DELETE success',
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.historicoRepository.deleteAll({agendamentoId: id});
    await this.agendamentoRepository.deleteById(id);
  }
}
