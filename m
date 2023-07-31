Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CE92F76CACB
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Aug 2023 12:24:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3DB674252BC;
	Wed,  2 Aug 2023 12:24:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E1985420202
	for <drbd-dev@lists.linbit.com>; Mon, 31 Jul 2023 16:04:14 +0200 (CEST)
Received: by mail-wm1-f50.google.com with SMTP id
	5b1f17b1804b1-3fc0aecf15bso50908095e9.1
	for <drbd-dev@lists.linbit.com>; Mon, 31 Jul 2023 07:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro.org; s=google; t=1690812254; x=1691417054;
	h=content-disposition:mime-version:message-id:subject:cc:to:from:date
	:from:to:cc:subject:date:message-id:reply-to;
	bh=2Dg6GxnQYenoFQ48YVr7SFR4s+ne8OKFkCXkmjfOMIg=;
	b=TsY65fqUbZUlmb5EhUxQYFCf0lmVpefQz4wpKctytwu4qRr7UxEqYYsGCIJK6NdW+/
	rHiIXgJ/26JOl7z5EKxZxnyjLh6LDUvy/RWyZiHZw1BOUD/jTKtKnA2AyBPjS9vcSAZF
	yp4HeeZtoYnWSHS2ddOXTC93hfbXl0IQXfLlss8hfhzQInV8hUT0hfTO+vt5SLDDUdxN
	V6wIs1nrymFg6XTmHwBygJQ0fvI98hWeYzEOtQKw9CLwDvA1dWq6oGmMFTKQ8/k/TtQh
	BpWFX28fdyVNDs5ysGG9ldydBQnO8YLlYJa5pvGAAS0FS8UG+QbOQdihqPUhpF/E7qMu
	F1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1690812254; x=1691417054;
	h=content-disposition:mime-version:message-id:subject:cc:to:from:date
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=2Dg6GxnQYenoFQ48YVr7SFR4s+ne8OKFkCXkmjfOMIg=;
	b=ZX8yeA1eV4swLtZZ3PNds7v25VvesJ/yDSq0gAB3m+p2f8/KHOAtSWd0YcSDRFI66z
	55ds39AjSQeLY9DGE/sz2QwEcChJ3EgzVJzO0qCZF8bQYraeeAlSinNcWLvEdPOozze3
	chkdzVPl/vALLtNRQyxgJ1Qcy5bFxn9TnP1S0efisk7V8WQweX6naXazkRYKVayCVx0f
	/4+Rx+NJc7TYno24AQiHM5IEnIQocdUV59u/FcvhkhBRLPhimXaBZJPs7Hy/FB7htvBu
	/+MFw1ogUpSfTjjCrOcT0alnkLFdBV81u3ctpoAcFPwVMdXXbL/EwwzuLcC4BgMKTCIs
	qHjQ==
X-Gm-Message-State: ABy/qLawtbPQPQXPIUprjaP6crwKLpeib/XKllTdiyAV5KSBadD9415A
	p5f50AjDxS/8bZd2lcuGMy5HHQ==
X-Google-Smtp-Source: APBJJlFj4qE/HhhfShAcS7Nvk1JF8QONgnoHs947CsrSAz8+0a3pJosKdPGolu4I5XShwGzIHl9LuA==
X-Received: by 2002:a5d:4649:0:b0:313:e8bf:a6e with SMTP id
	j9-20020a5d4649000000b00313e8bf0a6emr8397468wrs.21.1690812253972;
	Mon, 31 Jul 2023 07:04:13 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
	h16-20020adffa90000000b0031423a8f4f7sm13193500wrr.56.2023.07.31.07.04.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 31 Jul 2023 07:04:13 -0700 (PDT)
Date: Mon, 31 Jul 2023 11:15:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: bobo.shaobowang@huawei.com
Message-ID: <ca0093ef-ccb0-4e2e-b845-7b8930579783@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 02 Aug 2023 12:24:45 +0200
Cc: drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [bug report] drbd: destroy workqueue when drbd device
	was freed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hello Wang ShaoBo,

The patch 8692814b77ca: "drbd: destroy workqueue when drbd device was
freed" from Nov 24, 2022 (linux-next), leads to the following Smatch
static checker warning:

	drivers/block/drbd/drbd_main.c:2233 drbd_destroy_device()
	warn: sleeping in atomic context

drivers/block/drbd/drbd_main.c
    2193 void drbd_destroy_device(struct kref *kref)
    2194 {
    2195         struct drbd_device *device = container_of(kref, struct drbd_device, kref);
    2196         struct drbd_resource *resource = device->resource;
    2197         struct drbd_peer_device *peer_device, *tmp_peer_device;
    2198 
    2199         timer_shutdown_sync(&device->request_timer);
    2200 
    2201         /* paranoia asserts */
    2202         D_ASSERT(device, device->open_cnt == 0);
    2203         /* end paranoia asserts */
    2204 
    2205         /* cleanup stuff that may have been allocated during
    2206          * device (re-)configuration or state changes */
    2207 
    2208         drbd_backing_dev_free(device, device->ldev);
    2209         device->ldev = NULL;
    2210 
    2211         drbd_release_all_peer_reqs(device);
    2212 
    2213         lc_destroy(device->act_log);
    2214         lc_destroy(device->resync);
    2215 
    2216         kfree(device->p_uuid);
    2217         /* device->p_uuid = NULL; */
    2218 
    2219         if (device->bitmap) /* should no longer be there. */
    2220                 drbd_bm_cleanup(device);
    2221         __free_page(device->md_io.page);
    2222         put_disk(device->vdisk);
    2223         kfree(device->rs_plan_s);
    2224 
    2225         /* not for_each_connection(connection, resource):
    2226          * those may have been cleaned up and disassociated already.
    2227          */
    2228         for_each_peer_device_safe(peer_device, tmp_peer_device, device) {
    2229                 kref_put(&peer_device->connection->kref, drbd_destroy_connection);
    2230                 kfree(peer_device);
    2231         }
    2232         if (device->submit.wq)
--> 2233                 destroy_workqueue(device->submit.wq);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The patch introduces this call to destroy_workqueue() which is a
sleeping function (mutex_lock etc).

    2234         kfree(device);
    2235         kref_put(&resource->kref, drbd_destroy_resource);

It's the drbd_endio_write_sec_final() function which calls
drbd_destroy_device() with preempt disabled.

drbd_endio_write_sec_final() <- disables preempt
-> drbd_destroy_device()

regards,
dan carpenter
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
