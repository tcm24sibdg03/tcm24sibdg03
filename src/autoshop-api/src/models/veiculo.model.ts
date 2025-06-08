import {Entity, model, property, hasMany} from '@loopback/repository';
import {Agendamento} from './agendamento.model';
import {Historico} from './historico.model';

@model()
export class Veiculo extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  matricula: string;

  @property({
    type: 'string',
    required: true,
  })
  marca: string;

  @property({
    type: 'string',
    required: true,
  })
  modelo: string;

  @property({
    type: 'number',
    required: true,
  })
  ano: number;

  @property({
    type: 'number',
    required: true,
  })
  km: number;

  @property({
    type: 'string',
    required: true,
  })
  vin: string;

  @property({
    type: 'number',
    required: true,
  })
  clienteId: number;

  @hasMany(() => Agendamento)
  agendamentos: Agendamento[];

  @hasMany(() => Historico)
  historicos: Historico[];

  constructor(data?: Partial<Veiculo>) {
    super(data);
  }
}

export interface VeiculoRelations {
  // describe navigational properties here
}

export type VeiculoWithRelations = Veiculo & VeiculoRelations;
