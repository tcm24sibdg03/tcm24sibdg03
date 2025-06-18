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
import {Servico} from '../models';
import {ServicoRepository} from '../repositories';

export class ServicoController {
  constructor(
    @repository(ServicoRepository)
    public servicoRepository : ServicoRepository,
  ) {}

  @post('/servicos')
  @response(200, {
    description: 'Servico model instance',
    content: {'application/json': {schema: getModelSchemaRef(Servico)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Servico, {
            title: 'NewServico',
            exclude: ['id'],
          }),
        },
      },
    })
    servico: Omit<Servico, 'id'>,
  ): Promise<Servico> {
    return this.servicoRepository.create(servico);
  }

  @get('/servicos/count')
  @response(200, {
    description: 'Servico model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(Servico) where?: Where<Servico>,
  ): Promise<Count> {
    return this.servicoRepository.count(where);
  }

  @get('/servicos')
  @response(200, {
    description: 'Array of Servico model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Servico, {includeRelations: true}),
        },
      },
    },
  })
  async find(
    @param.filter(Servico) filter?: Filter<Servico>,
  ): Promise<Servico[]> {
    return this.servicoRepository.find(filter);
  }

  @patch('/servicos')
  @response(200, {
    description: 'Servico PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Servico, {partial: true}),
        },
      },
    })
    servico: Servico,
    @param.where(Servico) where?: Where<Servico>,
  ): Promise<Count> {
    return this.servicoRepository.updateAll(servico, where);
  }

  @get('/servicos/{id}')
  @response(200, {
    description: 'Servico model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(Servico, {includeRelations: true}),
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Servico, {exclude: 'where'}) filter?: FilterExcludingWhere<Servico>
  ): Promise<Servico> {
    return this.servicoRepository.findById(id, filter);
  }

  @patch('/servicos/{id}')
  @response(204, {
    description: 'Servico PATCH success',
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Servico, {partial: true}),
        },
      },
    })
    servico: Servico,
  ): Promise<void> {
    await this.servicoRepository.updateById(id, servico);
  }

  @put('/servicos/{id}')
  @response(204, {
    description: 'Servico PUT success',
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() servico: Servico,
  ): Promise<void> {
    await this.servicoRepository.replaceById(id, servico);
  }

  @del('/servicos/{id}')
  @response(204, {
    description: 'Servico DELETE success',
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.servicoRepository.deleteById(id);
  }
}
