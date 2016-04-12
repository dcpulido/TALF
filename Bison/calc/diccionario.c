#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "diccionario.h"

/**********************************************************************************/
/**********************************************************************************/

void* smalloc (size_t bytes) {
  void* ptr = malloc(bytes);
  
  if(ptr == NULL) {
    fprintf(stderr,"Problema al reservar memoria\n");
    exit(0);
    }
  else {
    return ptr;
    }
  }


/**********************************************************************************/
/**********************************************************************************/

void insertar_diccionario (DICCIONARIO *diccionario, char *nombre, double valor) {
  ENTRADA *nueva;
  ENTRADA *primera = diccionario->primera;
  int i;
  
  nueva = smalloc(sizeof(ENTRADA));
  nueva->siguiente = diccionario->primera;
  nueva->nombre = smalloc(sizeof(nombre)+1);
  nueva->valor = valor;
  strcpy(nueva->nombre,nombre);
  
  diccionario->primera = nueva;
  diccionario->num_entradas++;
  }


/**********************************************************************************/
/**********************************************************************************/

void inicializar_diccionario (DICCIONARIO *diccionario) {
  diccionario = smalloc(sizeof(DICCIONARIO));
  
  diccionario->primera = NULL;
  diccionario->num_entradas = 0;
  }


/**********************************************************************************/
/**********************************************************************************/

void liberar_diccionario (DICCIONARIO *diccionario) {
  ENTRADA *proxima = diccionario->primera;
  ENTRADA *borrada;
  diccionario->num_entradas = 0;
  
  while (proxima != NULL) {
    borrada = proxima;
    proxima = proxima->siguiente;
    free(borrada);
    }
  }


/**********************************************************************************/
/**********************************************************************************/

ENTRADA* buscar_diccionario (DICCIONARIO *diccionario, char *nombre) {
  ENTRADA *entrada = diccionario->primera;
  int i;
  
  for (i=0; i<diccionario->num_entradas; i++) {
    if (!strcmp(entrada->nombre,nombre)) { return entrada; }
    entrada = entrada->siguiente;
    }
  
  return NULL;
  }