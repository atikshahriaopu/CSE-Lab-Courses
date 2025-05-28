#include "glad.h"
#include <GLFW/glfw3.h>
#include <bits/stdc++.h>
using namespace std;

//Drawing Functions

void drawTriangle(float x1, float y1, float x2, float y2, float x3, float y3, float r, float g, float b) {
    glColor3f(r, g, b);
    glBegin(GL_TRIANGLES);
    glVertex2f(x1, y1);
    glVertex2f(x2, y2);
    glVertex2f(x3, y3);
    glEnd();

    glColor3f(0.0f, 0.0f, 0.0f); // outline
    glBegin(GL_LINE_LOOP);
    glVertex2f(x1, y1);
    glVertex2f(x2, y2);
    glVertex2f(x3, y3);
    glEnd();
}

void drawRect(float x, float y, float w, float h, float r, float g, float b, bool outline = true) {
    glColor3f(r, g, b);
    glBegin(GL_QUADS);
    glVertex2f(x, y);
    glVertex2f(x + w, y);
    glVertex2f(x + w, y + h);
    glVertex2f(x, y + h);
    glEnd();

    if (outline) {
        glColor3f(0, 0, 0); // outline
        glBegin(GL_LINE_LOOP);
        glVertex2f(x, y);
        glVertex2f(x + w, y);
        glVertex2f(x + w, y + h);
        glVertex2f(x, y + h);
        glEnd();
    }
}

void drawCircle(float cx, float cy, float radius, float r, float g, float b) {
    glColor3f(r, g, b);
    glBegin(GL_TRIANGLE_FAN);
    glVertex2f(cx, cy);
    for (int i = 0; i <= 20; i++) {
        float angle = 2.0f * 3.14159f * i / 20;
        glVertex2f(cx + radius * cos(angle), cy + radius * sin(angle));
    }
    glEnd();

    glColor3f(0.0f, 0.0f, 0.0f); // outline
    glBegin(GL_LINE_LOOP);
    for (int i = 0; i <= 20; i++) {
        float angle = 2.0f * 3.14159f * i / 20;
        glVertex2f(cx + radius * cos(angle), cy + radius * sin(angle));
    }
    glEnd();
}

void drawBus(float x, float y) {
  float wheelRadius = 0.07f;
  float bodyHeight = 0.35f;
  float bodyWidth = 0.6f;


  drawRect(x, y, bodyWidth, bodyHeight, 0.549f, 0.321f, 1.0f); //0.267f, 0.651f, 0.639f
  
  float winY = y + 0.20f;
  float winW = 0.08f;
  float winH = 0.10f;
  float gap = 0.03f;

  drawRect(x + 0.02f, winY, winW, winH, 0.600f, 0.945f, 0.831f);
  drawRect(x + 0.02f + (winW + gap) * 1, winY, winW, winH, 0.600f, 0.945f, 0.831f);
  drawRect(x + 0.02f + (winW + gap) * 2, winY, winW, winH, 0.600f, 0.945f, 0.831f);
  drawRect(x + 0.02f + (winW + gap) * 3, winY, winW, winH, 0.600f, 0.945f, 0.831f);

  //Door
  drawRect(x + 0.449f, y + 0.06f, 0.1f, 0.27f, 0.600f, 0.945f, 0.831f);

  // Wheels (gray)
  float wheelY = y - wheelRadius * 0.5f;
  drawCircle(x + 0.15f, wheelY, wheelRadius, 0.6f, 0.6f, 0.6f); // Left wheel
  drawCircle(x + 0.45f, wheelY, wheelRadius, 0.6f, 0.6f, 0.6f); // Right wheel
}



//Scene

float busX = -1.0f; // Starting position of the bus
float busSpeed = 0.0001f; // Speed of the bus

void renderScene() {
    glClearColor(0.78f, 1.0f, 0.87f, 1.0f); // background color
    glClear(GL_COLOR_BUFFER_BIT);

    // Mountains
    drawTriangle(-1.0f, -0.36f, -0.5f, 0.75f, 0.0f, -0.36f, 0.18f, 0.85f, 0.42f);
    drawTriangle(-0.1f, -0.36f, 0.2f, 0.4f, 0.5f, -0.36f, 0.18f, 0.85f, 0.42f);
    drawTriangle(0.1f, -0.36f, 0.6f, 0.75f, 1.0f, -0.36f, 0.18f, 0.85f, 0.42f);
    drawTriangle(0.7f, -0.36f, 0.9f, 0.4f, 1.1f, -0.36f, 0.18f, 0.85f, 0.42f);
    drawTriangle(-0.2f, -0.36f, 0.2f, 0.6f, 0.6f, -0.36f, 0.18f, 0.85f, 0.42f);

    // Road
    drawRect(-1.0f, -0.75f, 2.0f, 0.4f, 0.1f, 0.1f, 0.1f);

    // Road dashes
    for (float x = -0.9f; x < 1.0f; x += 0.4f) {
        drawRect(x, -0.6f, 0.15f, 0.05f, 1.0f, 1.0f, 1.0f);
    }

    // Bus
    drawBus(busX, -0.50f);

    // Update bus position
    busX += busSpeed;
    if (busX > 1.0f) {
        busX = -1.0f;
    }

    // Bottom grass
    drawRect(-1.0f, -1.0f, 2.0f, 0.25f, 0.78f, 1.0f, 0.87f, false);
}

//Resize

void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-1, 1, -1, 1, -1, 1);
    glMatrixMode(GL_MODELVIEW);
}

//Main

int main() {
    if (!glfwInit()) return -1;

    GLFWwindow* window = glfwCreateWindow(995, 669, "Mountain Scene", NULL, NULL);
    if (!window) {
        glfwTerminate();
        return -1;
    }

    glfwMakeContextCurrent(window);

    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) return -1;

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-1, 1, -1, 1, -1, 1);

    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

    while (!glfwWindowShouldClose(window)) {
        renderScene();
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}