import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/service.dart';

const List<Service> servicesData = [
  Service(
    id: 'fotos',
    title: 'Fotos para visa',
    description: 'Fotografías según requisitos del trámite.',
    icon: Icons.photo_camera,
    color: AppColors.primary,
  ),
  Service(
    id: 'formularios',
    title: 'Formularios',
    description: 'Apoyo para organizar tu solicitud.',
    icon: Icons.description,
    color: AppColors.secondary,
  ),
  Service(
    id: 'orientacion',
    title: 'Orientación',
    description: 'Información general para tu proceso.',
    icon: Icons.travel_explore,
    color: AppColors.primary,
  ),
  Service(
    id: 'documentos',
    title: 'Documentos',
    description: 'Organización de documentos importantes.',
    icon: Icons.folder_copy,
    color: AppColors.secondary,
  ),
];