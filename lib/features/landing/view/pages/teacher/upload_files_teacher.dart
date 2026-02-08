import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/uplode_teacher_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';
import 'package:telmeeth/core/api/teacher/model/request/uplode_teacher_request.dart';
import 'package:file_picker/file_picker.dart';


class UploadFilesTeacherPage extends StatefulWidget {
  final int teacherId;
  const UploadFilesTeacherPage({super.key, required this.teacherId});

  @override
  State<UploadFilesTeacherPage> createState() => _UploadFilesTeacherPageState();
}

class _UploadFilesTeacherPageState extends State<UploadFilesTeacherPage> {
  // Controllers for form fields
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  List<int> _unitIds = [];
  List<int> _lessonIds = [];
  File? _pickedFile;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<UplodesTeacherController>().fetchUploads();
    });
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _pickedFile = File(result.files.single.path!);
      });
    }
  }

  void _submitUpload() async {
    if (!_formKey.currentState!.validate() || _pickedFile == null) return;
    _formKey.currentState!.save();

    final request = FileUploadRequest(
      title: _title,
      description: _description,
      unitIds: _unitIds,
      lessonIds: _lessonIds,
      file: _pickedFile,
    );
    await context.read<UplodesTeacherController>().addUpload(request);
    // Refresh list after upload
    await context.read<UplodesTeacherController>().fetchUploads();
    // Reset fields
    setState(() {
      _title = '';
      _description = '';
      _pickedFile = null;
      // you may want to clear unitIds, lessonIds as well
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم رفع الملف بنجاح!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Files')),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveValues.w(context, 4)),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // ====== Title ======
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    initialValue: _title,
                    validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                    onSaved: (val) => _title = val ?? '',
                  ),
                  SizedBox(height: ResponsiveValues.h(context, 2)),
                  // ====== Description ======
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    initialValue: _description,
                    validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                    onSaved: (val) => _description = val ?? '',
                  ),
                  SizedBox(height: ResponsiveValues.h(context, 2)),
                  // ====== Pick File ======
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: _pickFile,
                        icon: Icon(Icons.attach_file),
                        label: Text('اختيار ملف'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade700,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(width: 12),
                      if (_pickedFile != null)
                        Expanded(child: Text(_pickedFile!.path.split('/').last)),
                    ],
                  ),
                  SizedBox(height: ResponsiveValues.h(context, 2)),
                  // يمكن هنا لاحقا إضافة حقول UnitIds/LessonIds إذا عندك قائمة وحدات/دروس
                  ElevatedButton(
                    onPressed: _submitUpload,
                    child: Text('رفع الملف'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade700,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ResponsiveValues.h(context, 4)),
            // قائمة الملفات المرفوعة
            Consumer<UplodesTeacherController>(
              builder: (context, ctrl, _) {
                if (ctrl.isLoading) return Center(child: CircularProgressIndicator());
                final uploads = ctrl.uploads?.uplodeData?.where((e) => e.teacherId == widget.teacherId).toList() ?? [];
                if (uploads.isEmpty) {
                  return Center(child: Text('لا يوجد ملفات مرفوعة'));
                }
                return ListView.builder(
                  itemCount: uploads.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    final file = uploads[i];
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.insert_drive_file),
                        title: Text(file.title ?? '-'),
                        subtitle: Text(file.description ?? ''),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await context.read<UplodesTeacherController>().deleteUploadFile(file.id!);
                            await context.read<UplodesTeacherController>().fetchUploads();
                          },
                        ),
                        onTap: () {
                          // فتح الملف بالرابط لو فيه fileUrl
                          if (file.fileUrl != null) {
                            // استخدم أي طريقة لفتح الرابط مثل launchUrl
                          }
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
