import type { Config } from "jest";
import nextJest from "next/jest.js";
import dotenv from "dotenv";

dotenv.config({ path: ".env.local" });

const createJestConfig = nextJest({
  dir: "./",
});

const config: Config = {
  coverageProvider: "v8",
  moduleNameMapper: {
    "^@/(.*)$": "<rootDir>/src/$1",
  },
  testEnvironment: "node",
  testMatch: ["**/__tests__/**/*.[jt]s?(x)", "**/?(*.)+(spec|test).[tj]s?(x)"],
};

export default createJestConfig(config);
