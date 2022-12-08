Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7A8646600
	for <lists+drbd-dev@lfdr.de>; Thu,  8 Dec 2022 01:37:46 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 165EC4252CC;
	Thu,  8 Dec 2022 01:37:46 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BC4442096D
	for <drbd-dev@lists.linbit.com>; Thu,  8 Dec 2022 01:37:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670459834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Na/DatNEjlEBtkHIEc2JrPJeXMI6lGrn4tJNlRzZp9M=;
	b=Ql0vBQkBZ7AO8WsA6gJtdLnGVHX5EIO0eKXQhtmI+Nh6NL5IU3nvCPlk/SoMxx6/Poav5O
	4J4tQIJu4BLkucj0togGHz9ezI5f2BDqpYB/p/OrEklASf3jBPTiZnVcj+FDjeNkTF49qE
	f6zWcbMaZBUU3OyAATYilGBb4HbQbmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
	[66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-650-qCYLgktkODafZ8b_0srOJg-1; Wed, 07 Dec 2022 19:37:11 -0500
X-MC-Unique: qCYLgktkODafZ8b_0srOJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 572CA185A79C;
	Thu,  8 Dec 2022 00:37:10 +0000 (UTC)
Received: from T590 (ovpn-8-18.pek2.redhat.com [10.72.8.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 247241121314;
	Thu,  8 Dec 2022 00:36:54 +0000 (UTC)
Date: Thu, 8 Dec 2022 08:36:49 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Gulam Mohamed <gulam.mohamed@oracle.com>
Message-ID: <Y5ExoZ+7Am6Nm8+h@T590>
References: <20221207223204.22459-1-gulam.mohamed@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221207223204.22459-1-gulam.mohamed@oracle.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Cc: nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org, song@kernel.org,
	dm-devel@redhat.com, ira.weiny@intel.com, agk@redhat.com,
	drbd-dev@lists.linbit.com, dave.jiang@intel.com,
	minchan@kernel.org, vishal.l.verma@intel.com,
	konrad.wilk@oracle.com, joe.jin@oracle.com,
	kent.overstreet@gmail.com, ngupta@vflare.org, kch@nvidia.com,
	senozhatsky@chromium.org, snitzer@kernel.org, colyli@suse.de,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	dan.j.williams@intel.com, ming.lei@redhat.com, axboe@kernel.dk,
	linux-raid@vger.kernel.org, martin.petersen@oracle.com,
	philipp.reisner@linbit.com, junxiao.bi@oracle.com,
	lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [RFC for-6.2/block V2] block: Change the granularity
 of io ticks from ms to ns
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

T24gV2VkLCBEZWMgMDcsIDIwMjIgYXQgMTA6MzI6MDRQTSArMDAwMCwgR3VsYW0gTW9oYW1lZCB3
cm90ZToKPiBBcyBwZXIgdGhlIHJldmlldyBjb21tZW50IGZyb20gSmVucyBBeGJvZSwgSSBhbSBy
ZS1zZW5kaW5nIHRoaXMgcGF0Y2gKPiBhZ2FpbnN0ICJmb3ItNi4yL2Jsb2NrIi4KPiAKPiAKPiBV
c2Uga3RpbWUgdG8gY2hhbmdlIHRoZSBncmFudWxhcml0eSBvZiBJTyBhY2NvdW50aW5nIGluIGJs
b2NrIGxheWVyIGZyb20KPiBtaWxsaS1zZWNvbmRzIHRvIG5hbm8tc2Vjb25kcyB0byBnZXQgdGhl
IHByb3BlciBsYXRlbmN5IHZhbHVlcyBmb3IgdGhlCj4gZGV2aWNlcyB3aG9zZSBsYXRlbmN5IGlz
IGluIG1pY3JvLXNlY29uZHMuIEFmdGVyIGNoYW5naW5nIHRoZSBncmFudWxhcml0eQo+IHRvIG5h
bm8tc2Vjb25kcyB0aGUgaW9zdGF0IGNvbW1hbmQsIHdoaWNoIHdhcyBzaG93aW5nIGluY29ycmVj
dCB2YWx1ZXMgZm9yCj4gJXV0aWwsIGlzIG5vdyBzaG93aW5nIGNvcnJlY3QgdmFsdWVzLgoKUGxl
YXNlIGFkZCB0aGUgdGhlb3J5IGJlaGluZCB3aHkgdXNpbmcgbmFuby1zZWNvbmRzIGNhbiBnZXQg
Y29ycmVjdCBhY2NvdW50aW5nLgoKPiAKPiBXZSBkaWQgbm90IHdvcmsgb24gdGhlIHBhdGNoIHRv
IGRyb3AgdGhlIGxvZ2ljIGZvcgo+IFNUQVRfUFJFQ0lTRV9USU1FU1RBTVBTIHlldC4gV2lsbCBk
byBpdCBpZiB0aGlzIHBhdGNoIGlzIG9rLgo+IAo+IFRoZSBpb3N0YXQgY29tbWFuZCB3YXMgcnVu
IGFmdGVyIHN0YXJ0aW5nIHRoZSBmaW8gd2l0aCBmb2xsb3dpbmcgY29tbWFuZAo+IG9uIGFuIE5W
TUUgZGlzay4gRm9yIHRoZSBzYW1lIGZpbyBjb21tYW5kLCB0aGUgaW9zdGF0ICV1dGlsIHdhcyBz
aG93aW5nCj4gfjEwMCUgZm9yIHRoZSBkaXNrcyB3aG9zZSBsYXRlbmNpZXMgYXJlIGluIHRoZSBy
YW5nZSBvZiBtaWNyb3NlY29uZHMuCj4gV2l0aCB0aGUga2VybmVsIGNoYW5nZXMgKGdyYW51bGFy
aXR5IHRvIG5hbm8tc2Vjb25kcyksIHRoZSAldXRpbCB3YXMKPiBzaG93aW5nIGNvcnJlY3QgdmFs
dWVzLiBGb2xsb3dpbmcgYXJlIHRoZSBkZXRhaWxzIG9mIHRoZSB0ZXN0IGFuZCB0aGVpcgo+IG91
dHB1dDoKPiAKPiBmaW8gY29tbWFuZAo+IC0tLS0tLS0tLS0tCj4gW2dsb2JhbF0KPiBicz0xMjhL
Cj4gaW9kZXB0aD0xCj4gZGlyZWN0PTEKPiBpb2VuZ2luZT1saWJhaW8KPiBncm91cF9yZXBvcnRp
bmcKPiB0aW1lX2Jhc2VkCj4gcnVudGltZT05MAo+IHRoaW5rdGltZT0xbXMKPiBudW1qb2JzPTEK
PiBuYW1lPXJhdy13cml0ZQo+IHJ3PXJhbmRydwo+IGlnbm9yZV9lcnJvcj1FSU86RUlPCj4gW2pv
YjFdCj4gZmlsZW5hbWU9L2Rldi9udm1lMG4xCj4gCj4gQ29ycmVjdCB2YWx1ZXMgYWZ0ZXIga2Vy
bmVsIGNoYW5nZXM6Cj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gaW9z
dGF0IG91dHB1dAo+IC0tLS0tLS0tLS0tLS0KPiBpb3N0YXQgLWQgL2Rldi9udm1lMG4xIC14IDEK
PiAKPiBEZXZpY2UgICAgICAgICAgICByX2F3YWl0IHdfYXdhaXQgYXF1LXN6IHJhcmVxLXN6IHdh
cmVxLXN6ICBzdmN0bSAgJXV0aWwKPiBudm1lMG4xICAgICAgICAgICAgICAwLjA4ICAgIDAuMDUg
ICAwLjA2ICAgMTI4LjAwICAgMTI4LjAwICAgMC4wNyAgIDYuNTAKPiAKPiBEZXZpY2UgICAgICAg
ICAgICByX2F3YWl0IHdfYXdhaXQgYXF1LXN6IHJhcmVxLXN6IHdhcmVxLXN6ICBzdmN0bSAgJXV0
aWwKPiBudm1lMG4xICAgICAgICAgICAgICAwLjA4ICAgIDAuMDYgICAwLjA2ICAgMTI4LjAwICAg
MTI4LjAwICAgMC4wNyAgIDYuMzAKPiAKPiBEZXZpY2UgICAgICAgICAgICByX2F3YWl0IHdfYXdh
aXQgYXF1LXN6IHJhcmVxLXN6IHdhcmVxLXN6ICBzdmN0bSAgJXV0aWwKPiBudm1lMG4xICAgICAg
ICAgICAgICAwLjA2ICAgIDAuMDUgICAwLjA2ICAgMTI4LjAwICAgMTI4LjAwICAgMC4wNiAgIDUu
NzAKPiAKPiBGcm9tIGZpbwo+IC0tLS0tLS0tCj4gUmVhZCBMYXRlbmN5OiBjbGF0ICh1c2VjKTog
bWluPTMyLCBtYXg9MjMzNSwgYXZnPTc5LjU0LCBzdGRldj0yOS45NQo+IFdyaXRlIExhdGVuY3k6
IGNsYXQgKHVzZWMpOiBtaW49MzgsIG1heD0xMzAsIGF2Zz01Ny43Niwgc3RkZXY9IDMuMjUKCkNh
biB5b3UgZXhwbGFpbiBhIGJpdCB3aHkgdGhlIGFib3ZlICV1dGlsIGlzIGNvcnJlY3Q/CgpCVFcs
ICV1dGlsIGlzIHVzdWFsbHkgbm90IGltcG9ydGFudCBmb3IgU1NEcywgcGxlYXNlIHNlZSAnbWFu
IGlvc3RhdCc6CgogICAgICV1dGlsCiAgICAgICAgICAgIFBlcmNlbnRhZ2Ugb2YgZWxhcHNlZCB0
aW1lIGR1cmluZyB3aGljaCBJL08gcmVxdWVzdHMgd2VyZSBpc3N1ZWQgdG8gdGhlIGRldmljZSAo
YmFuZHdpZHRoICB1dGnigJAKICAgICAgICAgICAgbGl6YXRpb24gZm9yIHRoZSBkZXZpY2UpLiBE
ZXZpY2Ugc2F0dXJhdGlvbiBvY2N1cnMgd2hlbiB0aGlzIHZhbHVlIGlzIGNsb3NlIHRvIDEwMCUg
Zm9yIGRldmljZXMKICAgICAgICAgICAgc2VydmluZyByZXF1ZXN0cyBzZXJpYWxseS4gIEJ1dCBm
b3IgZGV2aWNlcyBzZXJ2aW5nIHJlcXVlc3RzIGluIHBhcmFsbGVsLCBzdWNoIGFzICBSQUlEICBh
cnJheXMKICAgICAgICAgICAgYW5kIG1vZGVybiBTU0RzLCB0aGlzIG51bWJlciBkb2VzIG5vdCBy
ZWZsZWN0IHRoZWlyIHBlcmZvcm1hbmNlIGxpbWl0cy4KCgpUaGFua3MsIApNaW5nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5n
IGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20v
bWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
