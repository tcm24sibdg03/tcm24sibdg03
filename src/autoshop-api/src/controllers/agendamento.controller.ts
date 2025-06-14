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

export class AgendamentoController {
  constructor(
    @repository(AgendamentoRepository)
    public agendamentoRepository : AgendamentoRepository,
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
    return this.agendamentoRepository.create(agendamento);
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
          items: getModelSchemaRef(Agendamento, {includeRelations: true}),
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
        schema: getModelSchemaRef(Agendamento, {includeRelations: true}),
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
    await this.agendamentoRepository.deleteById(id);
  }
}
