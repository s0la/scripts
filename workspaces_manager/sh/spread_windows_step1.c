#include<stdio.h>
#include<stdlib.h>

int getIntFromCommand(FILE *command) {

	char *line = malloc(sizeof(char));
	int size;

	while(fgets(line, 2, command) != NULL) {

	 	sscanf (line, "%d", &size);
   }

   return size;
}

char *getWindowId(char line[]) {

	char *id;

	id = malloc(10 * sizeof(char));

	for (int i = 0; i < 10; i++) {
		id[i] = line[i];
	}

	return id;
}

void printArray(char *array[], size_t size) {
	for(int i = 0; i < size; i++) {
		printf("%s\n", array[i]);
	}
}

int countStringSize(char *stringToCount) {
	int count = 0;

	while(stringToCount[count] != '\0') count++;

	return count;
}

char *getStringCommand(char *rawCommand, char specifiedDesktop, int position) {
	int size = countStringSize(rawCommand);
	char *validCommand = malloc((size + 1) * sizeof(char*));

	for(int count = 0; count < size; count++) {
		if(count == size - position) {
			validCommand[count] = specifiedDesktop;
			validCommand[count + 1] = rawCommand[count++];
		} else {
			validCommand[count] = rawCommand[count];
		}
	}

	return validCommand;
}

int getSpecifiedValue(char *argv[], int current) {
	if (argv[1] == NULL) {
		return current;
	}

	return *argv[1] - '0';
}

int getWindowsCountOfSpecifiedDesktop(char specified) {
	char *windows = "wmctrl -l | grep -v 'xfce4-panel' | grep -v 'plank' | sed 1d | grep '^.\\{12\\}' | wc -l";
	char *command = getStringCommand(windows, specified, 9);

	FILE *windowsCountCommand = popen(command, "r");

	int windowsCount = getIntFromCommand(windowsCountCommand);

	//fclose(windowsCountCommand);

	return windowsCount;
}

char **populateArray(char specified, int windowsCount) {
	char *windows = "wmctrl -l | grep -v 'xfce4-panel' | grep -v 'plank' | sed 1d | grep '^.\\{12\\}'";
	char *command = getStringCommand(windows, specified, 1);
	char buffer[200];

	//int size = getWindowsCountOfSpecifiedDesktop(specified);
	int count = 0;

	char **arrayToReturn = malloc(windowsCount * sizeof(char*));

	FILE *windowsIds = popen(command, "r");

	while(fgets(buffer, 200, windowsIds)) {
	 	arrayToReturn[count++] = getWindowId(buffer);
    }

    fclose(windowsIds);

	return arrayToReturn;
}

int getCurrentDesktop() {
	FILE *currentDesktopCommand = popen("wmctrl -d | grep '*' | cut -c 1", "r");
	int currentDesktop = getIntFromCommand(currentDesktopCommand);
	
	fclose(currentDesktopCommand);

	return currentDesktop;
}

char *getValueFromCommand(FILE *command) {
	//fseek(command, 0L, SEEK_END);
	//int size = ftell(command);
	char *value = malloc(5 * sizeof(char));
	fread(value, sizeof(char), 5, command);

	return value;
}

void setParameters() {
	//int width = 
}

// char *getXCommand(char *command, char *id) {
// 	char finalCommand[countStringSize(command) + countStringSize(id)];

// 	sprintf(finalCommand, command, id);

// 	printf("%s\n", finalCommand);

// 	FILE *commandToExecute = popen(finalCommand, "r");

// 	printf("%s\n", getValueFromCommand(commandToExecute));
// }

// void printParametars(char *id) {
// 	FILE *xCommand = popen("xwininfo -id $1 | grep 'Absolute upper-left X:' | grep -Eo '(-?[0-9]+)'", "r");
// }

int getMultiplier(int multiplier) {
	int result = 1;

	while(multiplier > 0) {
		result *= 10;
		multiplier--;
	}

	return result;
}

int stringToInt(char *string) {
	int size = countStringSize(string) - 1;
	int sum = 0;

	for(int index = 0; size > 0; index++) {
		int muptilpier = getMultiplier(--size);
		int digit = string[index] - '0';

		sum += digit * muptilpier;
	}

	return sum;
}

char *getParameter(char *command, char *id) {
	char finalCommand[countStringSize(command) + countStringSize(id)];

	sprintf(finalCommand, command, id);

	FILE *commandToExecute = popen(finalCommand, "r");
	char *commandValue = getValueFromCommand(commandToExecute);
	fclose(commandToExecute);

	return commandValue;
}

char *getParameters(char *id) {
	FILE *fileToWriteTo = fopen("/home/sola/Desktop/file_to_append_to.txt", "a");

	if (stringToInt(getParameter("xwininfo -id %s | grep Width | grep -Eo '[0-9]+'", id)) > 1900) {
		char *minimizeCommand = "wmctrl -i -r %s -b toggle,maximized_vert,maximized_horz";
		char minimze[countStringSize(minimizeCommand) + countStringSize(id)];
		
		sprintf(minimze, minimizeCommand, id);

		fprintf(fileToWriteTo, "%s\n", minimze);
		system(minimze);
	}

	char *x = getParameter("xwininfo -id %s | grep 'Absolute upper-left X:' | grep -Eo '(-?[0-9]+)'", id);
	char *y = getParameter("xwininfo -id %s | grep 'Absolute upper-left Y:' | grep -Eo '(-?[0-9]+)'", id);
	char *width = getParameter("xwininfo -id %s | grep Width | grep -Eo '[0-9]+'", id);
	char *height = getParameter("xwininfo -id %s | grep Height | grep -Eo '[0-9]+'", id);

	char *baseCommand = "wmctrl -i -r %s -e 0,%d,%d,%d,%d\n";
	char completeCommand[countStringSize(baseCommand) + 
		countStringSize(x) + 
		countStringSize(y) + 
		countStringSize(width) + 
		countStringSize(height)];

	sprintf(completeCommand, baseCommand, id, stringToInt(x), stringToInt(y), stringToInt(width), stringToInt(height));
	fprintf(fileToWriteTo, "%s\n", completeCommand);
} 

int main(int argc, char *argv[]) {
	int current = getCurrentDesktop();
	int specified = getSpecifiedValue(argv, current);

    int wNum = getWindowsCountOfSpecifiedDesktop(specified + '0');

    char **arr = populateArray(specified + '0', wNum);
    char **commandsToExecute;

    printf("current: %d, specified: %d\n", current, specified);

    for(int i = 0; i < wNum; i++) {
    	printf("%s\n", arr[i]);
    	//printf("wmctrl -i -r %s -e 0,x,x,x,x\n", arr[i]);
    	//getXCommand("xwininfo -id %s | grep 'Absolute upper-left X:' | grep -Eo '(-?[0-9]+)'", arr[i]);
    	//printf("%d\n", getParameter("xwininfo -id %s | grep 'Absolute upper-left X:' | grep -Eo '(-?[0-9]+)'", arr[i]));
    	getParameters(arr[i]);
    }

    // int a = stringToInt("429");
    // printf("%d\n", a);
	// FILE *command = popen("wmctrl -d | wc -l", "r");
 //    printf("%d\n", countStringSize(command));
}