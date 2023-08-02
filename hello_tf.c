#include <stdio.h>
#include <tensorflow/c/c_api.h>

#define INPUT_SIZE 50


int main() {
  printf("Hello from TensorFlow C library version %s\n", TF_Version());

  // Cargar el modelo SavedModel
  TF_Graph* graph = TF_NewGraph();
  TF_Status* status = TF_NewStatus();
  TF_SessionOptions* session_options = TF_NewSessionOptions();
  TF_Buffer* run_options = NULL;
  const char* tags = "serve";

  TF_Session* session = TF_LoadSessionFromSavedModel(
        session_options, run_options, "modelo", &tags, 1, graph, NULL, status
  );

  if (TF_GetCode(status) != TF_OK) {
    fprintf(stderr, "Error al cargar el modelo: %s", TF_Message(status));
    return 1;
  }
  //input
  float input[INPUT_SIZE];
  for (int i = 0; i < INPUT_SIZE; i++) {
      input[i] = i + 1;
  }
  printf("Loaded model");
  return 0;
}