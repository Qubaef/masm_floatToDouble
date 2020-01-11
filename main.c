void floatToDouble(float *a, double *b);

int main()
{
	float a = 16.73126;
	double b;
	floatToDouble(&a, &b);
	return 0;
}