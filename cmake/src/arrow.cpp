
// // #include "arrow/io/api.h"
// // #include "arrow/parquet/arrow/reader.h"

// arrow::MemoryPool* pool = arrow::default_memory_pool();
// std::shared_ptr<arrow::io::RandomAccessFile> input;
// ARROW_ASSIGN_OR_RAISE(input, arrow::io::ReadableFile::Open(path_to_file));

// // Open Parquet file reader
// std::unique_ptr<parquet::arrow::FileReader> arrow_reader;
// ARROW_RETURN_NOT_OK(parquet::arrow::OpenFile(input, pool, &arrow_reader));

// // Read entire file as a single Arrow table
// std::shared_ptr<arrow::Table> table;
// ARROW_RETURN_NOT_OK(arrow_reader->ReadTable(&table));