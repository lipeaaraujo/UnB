#include <iostream>
using namespace std;

// Struct for a flight.
typedef struct {
  int id;
  int lenght;
  bool delay;
} Flight;

// Class that stores flight data.
class FlightData {
  private:
    int numOfFlights = 0;
    Flight *flights;

    // Intercalation sorting algorithm.
    void intercalation(int start, int mid, int end, Flight flights[]) {
      Flight *array = new Flight[(end-start)];
      int i = start, j = mid, k = 0;

      while (i < mid && j < end) {
        if (flights[i].lenght <= flights[j].lenght) {
          array[k++] = flights[i++];
        } else {
          array[k++] = flights[j++];
        }
      }

      while (i < mid) array[k++] = flights[i++];
      while (j < end) array[k++] = flights[j++];

      for (i = start; i < end; i++) flights[i] = array[i - start];
      free (array);
    }

    // Mergesort algorithm.
    void mergeSort(int start, int end, Flight flights[]) {
      if (start < end-1) {
        int mid = (start+end)/2;
        mergeSort(mid, end, flights);
        mergeSort(start, mid, flights);
        intercalation(start, mid, end, flights);
      }
    }

    // Insertion sort algorithm.
    void insertionSort(Flight flights[], int size) {
      int i, j;
      int next;
      for (i = 1; i < size; i++) {
        next = flights[i].lenght;
        for (j = i-1; (j >= 0) && (next < flights[j].lenght); j--) {
          flights[j+1] = flights[j];
        }
        flights[j+1].lenght = next;
      }
    }

    // Count the of flights registered in data.
    int countEntries(FILE *dataFile) {
      int count = 0;
      char character;

      while ((character = fgetc(dataFile)) != EOF) {
        if (character == '\n') {
          count++;
        }
      }

      return count;
    }

  public:
    // Add a flight to flights list.
    void addFlight(Flight newFlight) {
      flights[numOfFlights] = newFlight;
      numOfFlights++;
    }

    // Load all flight data from data file.
    void loadData(FILE *dataFile) {

      char character;

      flights = new Flight[countEntries(dataFile)];

      fseek(dataFile, 0, SEEK_SET);

      // Read first line labels.
      while ((character = fgetc(dataFile)) != EOF) {
        if (character == '\n') {
          break;
        }
      }

      // Read flight data.
      int id, flight, dayOfWeek, time, lenght;
      char airline[3], airportFrom[4], airportTo[4];
      int delay;

      Flight newFlight;

      while (!feof(dataFile)) {
        fscanf(dataFile, "%d, %2s, %d, %3s, %3s, %d, %d, %d, %d",
             &id, airline, &flight, airportFrom, airportTo, &dayOfWeek, &time, &lenght, &delay);
        
        newFlight.id = id;
        newFlight.lenght = lenght;
        newFlight.delay = delay;

        addFlight(newFlight);
      }
    }

    // Order flights by lenght.
    void orderByLenght() {
      // Using intercalation algorithm.
      mergeSort(0, numOfFlights, flights);
      //insertionSort(flights, numOfFlights);
    }
    
    // Create a new file and store data.
    void writeData() {
      FILE *data = fopen("data.txt", "w+");

      if (data != NULL) {
        fprintf(data, "id | lenght | delay\n");

        for (int i = 0; i < numOfFlights; i++) {
          fprintf(data, "%d | %d | %d\n", flights[i].id, flights[i].lenght, flights[i].delay);
        }

        fclose(data);
      } else {
        cout << "Failed to save data!";
      }
    }
};

int main() {

  FILE *dataFile = fopen("Airlines.csv", "r");
  FlightData flightData;

  if (dataFile != NULL) {
    flightData.loadData(dataFile);
    flightData.orderByLenght();
    flightData.writeData();

    fclose(dataFile);
  } else {
    cout << "Failed to open file!";
  }

  cout << "Success!" << endl;

  return 0;
}