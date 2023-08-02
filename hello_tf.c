#include <stdio.h>
#include <tensorflow/c/c_api.h>

int main() {
  printf("Hello from TensorFlow C library version %s\n", TF_Version());

  // Cargar el modelo SavedModel
  TF_Graph* graph = TF_NewGraph();
  TF_Status* status = TF_NewStatus();
  TF_SessionOptions* session_options = TF_NewSessionOptions();
  TF_Buffer* run_options = NULL;
  return 0;
}