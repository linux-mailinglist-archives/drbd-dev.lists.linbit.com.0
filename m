Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B2524E8F
	for <lists+drbd-dev@lfdr.de>; Thu, 12 May 2022 15:46:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A76A42088A;
	Thu, 12 May 2022 15:46:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E994A420625
	for <drbd-dev@lists.linbit.com>; Thu, 12 May 2022 15:45:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 76D9DB82701;
	Thu, 12 May 2022 13:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEDEC385B8;
	Thu, 12 May 2022 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652362636;
	bh=LI1qbz5Y4N8v20ksb5ReVZbP3ba5VXVxLdezNtG8K2A=;
	h=Subject:To:Cc:From:Date:From;
	b=QnyIB132L2qCCABPIw5huO4ArzZ9wS93EGZbAUSd9bT1643hSr/WbYUdJoW0BoTNW
	zHAF3pNbtWmkQLHtlH9pHDiQSAdn5V2aQa4LnNe3ksz/X2p9rGwwOBx3aHLIZ4H/u8
	WpYHNVS10Yg8LnpWC/chBheQlF+G77UG4GERFtM8=
To: axboe@kernel.dk, drbd-dev@lists.linbit.com, gregkh@linuxfoundation.org,
	lars.ellenberg@linbit.com, lee.jones@linaro.org,
	nathan@kernel.org, philipp.reisner@linbit.com
From: <gregkh@linuxfoundation.org>
Date: Thu, 12 May 2022 15:37:13 +0200
Message-ID: <1652362633208176@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
Cc: stable-commits@vger.kernel.org
Subject: [Drbd-dev] Patch "block: drbd: drbd_nl: Make conversion to 'enum
	drbd_ret_code' explicit" has been added to the 4.14-stable tree
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

ClRoaXMgaXMgYSBub3RlIHRvIGxldCB5b3Uga25vdyB0aGF0IEkndmUganVzdCBhZGRlZCB0aGUg
cGF0Y2ggdGl0bGVkCgogICAgYmxvY2s6IGRyYmQ6IGRyYmRfbmw6IE1ha2UgY29udmVyc2lvbiB0
byAnZW51bSBkcmJkX3JldF9jb2RlJyBleHBsaWNpdAoKdG8gdGhlIDQuMTQtc3RhYmxlIHRyZWUg
d2hpY2ggY2FuIGJlIGZvdW5kIGF0OgogICAgaHR0cDovL3d3dy5rZXJuZWwub3JnL2dpdC8/cD1s
aW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9zdGFibGUtcXVldWUuZ2l0O2E9c3VtbWFyeQoKVGhlIGZp
bGVuYW1lIG9mIHRoZSBwYXRjaCBpczoKICAgICBibG9jay1kcmJkLWRyYmRfbmwtbWFrZS1jb252
ZXJzaW9uLXRvLWVudW0tZHJiZF9yZXRfY29kZS1leHBsaWNpdC5wYXRjaAphbmQgaXQgY2FuIGJl
IGZvdW5kIGluIHRoZSBxdWV1ZS00LjE0IHN1YmRpcmVjdG9yeS4KCklmIHlvdSwgb3IgYW55b25l
IGVsc2UsIGZlZWxzIGl0IHNob3VsZCBub3QgYmUgYWRkZWQgdG8gdGhlIHN0YWJsZSB0cmVlLApw
bGVhc2UgbGV0IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiBrbm93IGFib3V0IGl0LgoKCkZyb20g
MWYxZTg3YjRkYzQ1OThlYWM1N2E2OTg2ODUzNGI5MmQ2NWU0N2U4MiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKRnJvbTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KRGF0ZTogRnJp
LCAxMiBNYXIgMjAyMSAxMDo1NToyNiArMDAwMApTdWJqZWN0OiBibG9jazogZHJiZDogZHJiZF9u
bDogTWFrZSBjb252ZXJzaW9uIHRvICdlbnVtIGRyYmRfcmV0X2NvZGUnIGV4cGxpY2l0Ck1JTUUt
VmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250
ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpGcm9tOiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgoKY29tbWl0IDFmMWU4N2I0ZGM0NTk4ZWFjNTdhNjk4Njg1MzRiOTJkNjVlNDdl
ODIgdXBzdHJlYW0uCgpGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2Fybmlu
ZyhzKToKCiBmcm9tIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmM6MjQ6CiBkcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9ubC5jOiBJbiBmdW5jdGlvbiDigJhkcmJkX2FkbV9zZXRfcm9sZeKAmToK
IGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmM6NzkzOjExOiB3YXJuaW5nOiBpbXBsaWNpdCBj
b252ZXJzaW9uIGZyb20g4oCYZW51bSBkcmJkX3N0YXRlX3J24oCZIHRvIOKAmGVudW0gZHJiZF9y
ZXRfY29kZeKAmSBbLVdlbnVtLWNvbnZlcnNpb25dCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9u
bC5jOjc5NToxMTogd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIOKAmGVudW0gZHJi
ZF9zdGF0ZV9yduKAmSB0byDigJhlbnVtIGRyYmRfcmV0X2NvZGXigJkgWy1XZW51bS1jb252ZXJz
aW9uXQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYzogSW4gZnVuY3Rpb24g4oCYZHJiZF9h
ZG1fYXR0YWNo4oCZOgogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYzoxOTY1OjEwOiB3YXJu
aW5nOiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20g4oCYZW51bSBkcmJkX3N0YXRlX3J24oCZIHRv
IOKAmGVudW0gZHJiZF9yZXRfY29kZeKAmSBbLVdlbnVtLWNvbnZlcnNpb25dCiBkcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9ubC5jOiBJbiBmdW5jdGlvbiDigJhkcmJkX2FkbV9jb25uZWN04oCZOgog
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYzoyNjkwOjEwOiB3YXJuaW5nOiBpbXBsaWNpdCBj
b252ZXJzaW9uIGZyb20g4oCYZW51bSBkcmJkX3N0YXRlX3J24oCZIHRvIOKAmGVudW0gZHJiZF9y
ZXRfY29kZeKAmSBbLVdlbnVtLWNvbnZlcnNpb25dCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9u
bC5jOiBJbiBmdW5jdGlvbiDigJhkcmJkX2FkbV9kaXNjb25uZWN04oCZOgogZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfbmwuYzoyODAzOjExOiB3YXJuaW5nOiBpbXBsaWNpdCBjb252ZXJzaW9uIGZy
b20g4oCYZW51bSBkcmJkX3N0YXRlX3J24oCZIHRvIOKAmGVudW0gZHJiZF9yZXRfY29kZeKAmSBb
LVdlbnVtLWNvbnZlcnNpb25dCgpDYzogUGhpbGlwcCBSZWlzbmVyIDxwaGlsaXBwLnJlaXNuZXJA
bGluYml0LmNvbT4KQ2M6IExhcnMgRWxsZW5iZXJnIDxsYXJzLmVsbGVuYmVyZ0BsaW5iaXQuY29t
PgpDYzogSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgpDYzogZHJiZC1kZXZAbGlzdHMubGlu
Yml0LmNvbQpDYzogbGludXgtYmxvY2tAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyMTAzMTIxMDU1MzAuMjIxOTAwOC04LWxlZS5qb25lc0BsaW5hcm8ub3JnClNpZ25l
ZC1vZmYtYnk6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KQ2M6IE5hdGhhbiBDaGFuY2Vs
bG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9ubC5jIHwgICAxMyArKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQoKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYwor
KysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jCkBAIC03NzQsOSArNzc0LDExIEBAIGlu
dCBkcmJkX2FkbV9zZXRfcm9sZShzdHJ1Y3Qgc2tfYnVmZiAqc2sKIAltdXRleF9sb2NrKCZhZG1f
Y3R4LnJlc291cmNlLT5hZG1fbXV0ZXgpOwogCiAJaWYgKGluZm8tPmdlbmxoZHItPmNtZCA9PSBE
UkJEX0FETV9QUklNQVJZKQotCQlyZXRjb2RlID0gZHJiZF9zZXRfcm9sZShhZG1fY3R4LmRldmlj
ZSwgUl9QUklNQVJZLCBwYXJtcy5hc3N1bWVfdXB0b2RhdGUpOworCQlyZXRjb2RlID0gKGVudW0g
ZHJiZF9yZXRfY29kZSlkcmJkX3NldF9yb2xlKGFkbV9jdHguZGV2aWNlLAorCQkJCQkJUl9QUklN
QVJZLCBwYXJtcy5hc3N1bWVfdXB0b2RhdGUpOwogCWVsc2UKLQkJcmV0Y29kZSA9IGRyYmRfc2V0
X3JvbGUoYWRtX2N0eC5kZXZpY2UsIFJfU0VDT05EQVJZLCAwKTsKKwkJcmV0Y29kZSA9IChlbnVt
IGRyYmRfcmV0X2NvZGUpZHJiZF9zZXRfcm9sZShhZG1fY3R4LmRldmljZSwKKwkJCQkJCVJfU0VD
T05EQVJZLCAwKTsKIAogCW11dGV4X3VubG9jaygmYWRtX2N0eC5yZXNvdXJjZS0+YWRtX211dGV4
KTsKIAlnZW5sX2xvY2soKTsKQEAgLTE5NDEsNyArMTk0Myw3IEBAIGludCBkcmJkX2FkbV9hdHRh
Y2goc3RydWN0IHNrX2J1ZmYgKnNrYiwKIAlkcmJkX2ZsdXNoX3dvcmtxdWV1ZSgmY29ubmVjdGlv
bi0+c2VuZGVyX3dvcmspOwogCiAJcnYgPSBfZHJiZF9yZXF1ZXN0X3N0YXRlKGRldmljZSwgTlMo
ZGlzaywgRF9BVFRBQ0hJTkcpLCBDU19WRVJCT1NFKTsKLQlyZXRjb2RlID0gcnY7ICAvKiBGSVhN
RTogVHlwZSBtaXNtYXRjaC4gKi8KKwlyZXRjb2RlID0gKGVudW0gZHJiZF9yZXRfY29kZSlydjsK
IAlkcmJkX3Jlc3VtZV9pbyhkZXZpY2UpOwogCWlmIChydiA8IFNTX1NVQ0NFU1MpCiAJCWdvdG8g
ZmFpbDsKQEAgLTI2NzEsNyArMjY3Myw4IEBAIGludCBkcmJkX2FkbV9jb25uZWN0KHN0cnVjdCBz
a19idWZmICpza2IKIAl9CiAJcmN1X3JlYWRfdW5sb2NrKCk7CiAKLQlyZXRjb2RlID0gY29ubl9y
ZXF1ZXN0X3N0YXRlKGNvbm5lY3Rpb24sIE5TKGNvbm4sIENfVU5DT05ORUNURUQpLCBDU19WRVJC
T1NFKTsKKwlyZXRjb2RlID0gKGVudW0gZHJiZF9yZXRfY29kZSljb25uX3JlcXVlc3Rfc3RhdGUo
Y29ubmVjdGlvbiwKKwkJCQkJTlMoY29ubiwgQ19VTkNPTk5FQ1RFRCksIENTX1ZFUkJPU0UpOwog
CiAJY29ubl9yZWNvbmZpZ19kb25lKGNvbm5lY3Rpb24pOwogCW11dGV4X3VubG9jaygmYWRtX2N0
eC5yZXNvdXJjZS0+YWRtX211dGV4KTsKQEAgLTI3NzcsNyArMjc4MCw3IEBAIGludCBkcmJkX2Fk
bV9kaXNjb25uZWN0KHN0cnVjdCBza19idWZmICoKIAltdXRleF9sb2NrKCZhZG1fY3R4LnJlc291
cmNlLT5hZG1fbXV0ZXgpOwogCXJ2ID0gY29ubl90cnlfZGlzY29ubmVjdChjb25uZWN0aW9uLCBw
YXJtcy5mb3JjZV9kaXNjb25uZWN0KTsKIAlpZiAocnYgPCBTU19TVUNDRVNTKQotCQlyZXRjb2Rl
ID0gcnY7ICAvKiBGSVhNRTogVHlwZSBtaXNtYXRjaC4gKi8KKwkJcmV0Y29kZSA9IChlbnVtIGRy
YmRfcmV0X2NvZGUpcnY7CiAJZWxzZQogCQlyZXRjb2RlID0gTk9fRVJST1I7CiAJbXV0ZXhfdW5s
b2NrKCZhZG1fY3R4LnJlc291cmNlLT5hZG1fbXV0ZXgpOwoKClBhdGNoZXMgY3VycmVudGx5IGlu
IHN0YWJsZS1xdWV1ZSB3aGljaCBtaWdodCBiZSBmcm9tIGxlZS5qb25lc0BsaW5hcm8ub3JnIGFy
ZQoKcXVldWUtNC4xNC9ibG9jay1kcmJkLWRyYmRfbmwtbWFrZS1jb252ZXJzaW9uLXRvLWVudW0t
ZHJiZF9yZXRfY29kZS1leHBsaWNpdC5wYXRjaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMu
bGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJk
LWRldgo=
