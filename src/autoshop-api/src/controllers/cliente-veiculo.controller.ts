import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody,
} from '@loopback/rest';
import {
  Cliente,
  Veiculo,
} from '../models';
import {ClienteRepository} from '../repositories';

export class ClienteVeiculoController {
  constructor(
    @repository(ClienteRepository) protected clienteRepository: ClienteRepository,
  ) { }

  @get('/clientes/{id}/veiculos', {
    responses: {
      '200': {
        description: 'Array of Cliente has many Veiculo',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Veiculo)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Veiculo>,
  ): Promise<Veiculo[]> {
    return this.clienteRepository.veiculos(id).find(filter);
  }

  @post('/clientes/{id}/veiculos', {
    responses: {
      '200': {
        description: 'Cliente model instance',
        content: {'application/json': {schema: getModelSchemaRef(Veiculo)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Cliente.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Veiculo, {
            title: 'NewVeiculoInCliente',
            exclude: ['id'],
            optional: ['clienteId']
          }),
        },
      },
    }) veiculo: Omit<Veiculo, 'id'>,
  ): Promise<Veiculo> {
    return this.clienteRepository.veiculos(id).create(veiculo);
  }

  @patch('/clientes/{id}/veiculos', {
    responses: {
      '200': {
        description: 'Cliente.Veiculo PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Veiculo, {partial: true}),
        },
      },
    })
    veiculo: Partial<Veiculo>,
    @param.query.object('where', getWhereSchemaFor(Veiculo)) where?: Where<Veiculo>,
  ): Promise<Count> {
    return this.clienteRepository.veiculos(id).patch(veiculo, where);
  }

  @del('/clientes/{id}/veiculos', {
    responses: {
      '200': {
        description: 'Cliente.Veiculo DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Veiculo)) where?: Where<Veiculo>,
  ): Promise<Count> {
    return this.clienteRepository.veiculos(id).delete(where);
  }
}
